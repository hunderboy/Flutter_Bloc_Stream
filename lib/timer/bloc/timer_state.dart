part of 'timer_bloc.dart';

/**
 * 먼저 TimerBloc이 가질 수 있는 TimerState를 정의합니다.

    TimerBloc의 상태는 다음 중 하나입니다:

    - [TimerInitial]: 카운트다운을 시작할 준비가 된 상태.
    - [TimerRunInProgress]: 카운트다운 중인 상태.
    - [TimerRunPause]: 남은 시간에서 일시 정지된 상태.
    - [TimerRunComplete]: 남은 시간이 0 으로 완료된 상태.

    각 상태는 UI와 사용자가 수행할 수 있는 액션에 영향을 줍니다. 예를 들어:

    - [TimerInitial] -> 타이머를 시작할 수 있습니다.
    - [TimerRunInProgress] -> 타이머를 일시 정지하고 리셋할 수 있으며, 남은 시간을 볼 수 있습니다.
    - [TimerRunPause] -> 타이머를 재개 or 리셋할 수 있습니다.
    - [TimerRunComplete] -> 타이머를 리셋할 수 있습니다.
 */
sealed class TimerState {
  const TimerState(this.duration);
  final int duration;
}


/// 모든 TimerState는 duration 속성을 가진 추상 클래스 TimerState를 상속합니다.
/// TimerBloc이 어떤 상태에 있든 남은 시간을 알아야 하기 때문입니다.
/// 또한 TimerState는 Equatable을 상속해서 동일한 상태가 발생했을 때 불필요한 rebuild를 방지합니다.
final class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  String toString() => 'TimerInitial { duration: $duration }';
}

final class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(super.duration);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

final class TimerRunPause extends TimerState {
  const TimerRunPause(super.duration);

  @override
  String toString() => 'TimerRunPause { duration: $duration }';
}

final class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);

  @override
  String toString() => 'TimerRunComplete';
}
