import 'package:bloc/bloc.dart';



/**
 * 먼저 [BlocObserver]를 만들어 봅니다. 이걸 사용하면 앱 전체의 상태 변화를 관찰할 수 있습니다.
 */
class CounterObserver extends BlocObserver {
  const CounterObserver();

  // 여기서는 onChange만 override해서 모든 상태 변화를 확인합니다.
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // ignore: avoid_print
    print('${bloc.runtimeType} $change');
  }// ㅌㅔ그스ㅇㅇ
}