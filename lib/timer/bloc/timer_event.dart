part of 'timer_bloc.dart';

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
