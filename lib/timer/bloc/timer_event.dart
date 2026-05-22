part of 'timer_bloc.dart';


/**
 * TimerBloc은 다음 이벤트를 처리해야 합니다:

    TimerStarted: 타이머를 시작해야 함을 알립니다.
    TimerPaused: 타이머를 일시 정지해야 함을 알립니다.
    TimerResumed: 타이머를 재개해야 함을 알립니다.
    TimerReset: 타이머를 원래 상태로 리셋해야 함을 알립니다.
    _TimerTicked: tick이 발생했고 그에 따라 상태를 업데이트해야 함을 알립니다.
 */
sealed class TimerEvent {
  const TimerEvent();
}

final class TimerStarted extends TimerEvent {
  const TimerStarted({required this.duration});
  final int duration;
}

final class TimerPaused extends TimerEvent {
  const TimerPaused();
}

final class TimerResumed extends TimerEvent {
  const TimerResumed();
}

final class TimerReset extends TimerEvent {
  const TimerReset();
}

// 내부 이벤트: Ticker 스트림에서 매초 발생
final class _TimerTicked extends TimerEvent {
  const _TimerTicked({required this.duration});
  final int duration;
}
