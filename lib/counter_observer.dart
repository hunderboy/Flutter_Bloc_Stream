import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';



/**
 * 먼저 [BlocObserver]를 만들어 봅니다. 이걸 사용하면 앱 전체의 상태 변화를 관찰할 수 있습니다.
 */
class CounterObserver extends BlocObserver {
  const CounterObserver();

  @override
  void onTransition(
      Bloc<dynamic, dynamic> bloc,
      Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print(transition);
    }
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print(error);
    }
    super.onError(bloc, error, stackTrace);
  }

  // 여기서는 onChange만 override해서 모든 상태 변화를 확인합니다.
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // ignore: avoid_print
    print('${bloc.runtimeType} $change');
  }

}