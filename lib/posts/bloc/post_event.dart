part of 'post_bloc.dart';


/**
 * 3. 구현에 들어가기 전에 PostBloc이 뭘 할 건지 정의해야 합니다.
    사용자 입력(스크롤)에 반응해서 프레젠테이션 레이어가 표시할 수 있도록 더 많은 post를 가져옵니다.
 */
sealed class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class PostFetched extends PostEvent {}