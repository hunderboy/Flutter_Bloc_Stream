import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post_bloc.dart';
import '../data/post_repository.dart';
import 'posts_list.dart';

/**
 * 2. UI 화면 부터 작성
 * BlocProvider -> create PostBloc 설정
 * PostBloc 를 작성하지 않더라도 일단 child 작성
 */
class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocProvider(
        // PostBloc 인스턴스 생성과 동시에 ..add(PostFetched()) 로 첫 번째 이벤트를 즉시 dispatch
        // 초기 상태: PostState(status: initial, posts: [], hasReachedMax: false)
        create: (_) => PostBloc(postRepository: PostRepository())..add(PostFetched()),
        child: const PostsList(),
      ),
    );
  }
}
