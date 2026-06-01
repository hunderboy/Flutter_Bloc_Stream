import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post_bloc.dart';
import '../models/models.dart';

// [UI] 스크롤 90% 도달
//  │
//  │  add(PostFetched())          ← Event 발행
//  ▼
// [Bloc] _onPostFetched() 실행
//  │  state.hasReachedMax 확인    ← 현재 State를 읽음
//  │  API 호출
//  │  emit(state.copyWith(...))   ← 새 State 발행
//  ▼
// [State] PostState(
//    status: success,
//    posts: [...40개],              ← UI가 표현할 데이터
//    hasReachedMax: false
// )
//  │
//  ▼
// [UI] BlocBuilder가 새 State 수신 → ListView 리빌드


class PostsList extends StatefulWidget {
  const PostsList({super.key});

  @override
  State<PostsList> createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// Bloc 사용을 위한 BlocBuilder<PostBloc, PostState>
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        switch (state.status) {
          case PostStatus.failure:
            return const Center(child: Text('posts 불러오기에 실패했습니다.'));
          case PostStatus.success:
            if (state.posts.isEmpty) {
              return const Center(child: Text('posts가 없습니다.'));
            }
            return ListView.builder(
              itemBuilder: (context, index) {
                return index >= state.posts.length
                    ? const _BottomLoader()
                    : _PostListItem(post: state.posts[index]);
              },
              itemCount:
                  state.hasReachedMax
                      ? state.posts.length
                      : state.posts.length + 1,
              controller: _scrollController,
            );
          case PostStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void _onScroll() {
    if (_isBottom) context.read<PostBloc>().add(PostFetched()); // Post 요청
  }

  /// List 의 최하단 인지 체크하여 true,false 리턴하는 메소드
  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9); // 90% 지점
  }

}


/// 스크롤 하단 도착시 표시되는 Loader
class _BottomLoader extends StatelessWidget {
  const _BottomLoader();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}

/// ListView 의 Item
class _PostListItem extends StatelessWidget {
  const _PostListItem({required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('${post.id}', style: textTheme.bodySmall),
        title: Text(post.title),
        isThreeLine: true,
        subtitle: Text(post.body),
        dense: true,
      ),
    );
  }
}
