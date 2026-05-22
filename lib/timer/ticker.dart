
/// Ticker는 타이머 앱의 데이터 소스입니다. 구독하고 반응할 수 있는 tick 스트림을 제공합니다.
/// Ticker 클래스는 원하는 tick 수(초)를 받아서
/// 매초마다 남은 시간을 emit하는 스트림을 반환하는 tick 함수를 제공합니다.
class Ticker {
  const Ticker();

  Stream<int> tick({required int ticks}) {
    return Stream.periodic(
      const Duration(seconds: 1),
      (x) => ticks - x - 1,
    ).take(ticks);
  }
}
