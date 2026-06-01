import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/post_repository.dart';
import '../models/models.dart';

part 'post_event.dart';
part 'post_state.dart';


/**
 * 5. Bloc 작성
 * State는 항상 불변(immutable) 이고, Bloc은 emit() 으로만 새 State를 교체합니다.
 * Equatable 의 props 가 변경됐을 때만 BlocBuilder가 리빌드하므로, 불필요한 UI 업데이트를 막아줍니다.
 */
class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({
    required PostRepository postRepository
  }): _postRepository = postRepository,
  super(const PostState()) {
    // on<PostFetched> 로 어떤 이벤트가 오면 어떤 메서드를 실행할지 등록합니다.
    // 이 프로젝트에서 Event는 PostFetched 하나뿐이므로, 핸들러도 하나입니다.
    on<PostFetched>(_onPostFetched);
  }

  final PostRepository _postRepository;

  Future<void> _onPostFetched(
    PostFetched event,
    Emitter<PostState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      // state → 현재 상태를 읽음 (Bloc 내부에서 항상 접근 가능)
      if (state.status == PostStatus.initial) {
        final posts = await _postRepository.fetchPosts();
        return emit( // emit() → 새 State를 발행 → BlocBuilder가 감지해서 UI 리빌드
          state.copyWith( // copyWith() → 기존 state를 복사하면서 바뀐 필드만 교체 (불변성 유지)
            status: PostStatus.success,
            posts: posts,
            hasReachedMax: false,
          ),
        );
      }
      final posts = await _postRepository.fetchPosts(startIndex: state.posts.length);
      emit(
        posts.isEmpty
            ? state.copyWith(hasReachedMax: true)
            : state.copyWith(
                status: PostStatus.success,
                posts: List.of(state.posts)..addAll(posts),
                hasReachedMax: false,
              ),
      );
    } catch (_) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }
}
