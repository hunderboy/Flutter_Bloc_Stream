part of 'post_bloc.dart';

/**
 * 4. Post 상태를 정의
 * PostInitial: 초기 배치의 post가 로드되는 동안 로딩 인디케이터를 렌더링해야 함을 알립니다.
   PostSuccess: 렌더링할 콘텐츠가 있음을 알립니다.
      posts: 표시할 List<Post>
      hasReachedMax: 최대 post 수에 도달했는지 여부
   PostFailure: post를 가져오는 중 에러가 발생했음을 알립니다.
 */
enum PostStatus {
  initial,
  success,
  failure
}

final class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.posts = const <Post>[], // 표시할 List<Post>
    this.hasReachedMax = false,  // 최대 post 수에 도달했는지 여부
  });

  final PostStatus status;
  final List<Post> posts;
  final bool hasReachedMax;

  PostState copyWith({
    PostStatus? status,
    List<Post>? posts,
    bool? hasReachedMax,
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, posts, hasReachedMax];
}
