import 'package:bloc/bloc.dart';

/**
 * [int]를 상태로 관리하는 [큐빗].
 */
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  /// Add 1 to the current state.
  void increment() => emit(state + 1);

  /// Subtract 1 from the current state.
  void decrement() => emit(state - 1);
}