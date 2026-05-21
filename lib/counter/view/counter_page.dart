import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter.dart';


/**
 * [CounterView]에 [CounterCubit] 인스턴스를 제공하는 [StatelessWidget]입니다.
 */
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    /**
     * BlocProvider 가 하는 일
       BlocProvider 는 Flutter 의 InheritedWidget 기반으로 CounterCubit 인스턴스를 위젯 트리에 등록

        CounterPage
          └─ BlocProvider (CounterCubit 인스턴스를 트리에 등록)
              └─ CounterView
                  └─ BlocBuilder         ← todo: context 로 위를 탐색해서 CounterCubit 을 찾음
                  └─ context.read<CounterCubit>()  ← 동일하게 위를 탐색
     */
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );

    /**
     * 만약 BlocProvider 없이 직접 생성하면?

        // BlocProvider 없이 직접 넘기는 방식
        class CounterPage extends StatelessWidget {
          @override
          Widget build(BuildContext context) {
            final cubit = CounterCubit(); // 직접 생성
            return CounterView(cubit: cubit); // 명시적으로 전달
          }
        }

        이렇게 하면 당장은 동작하지만 문제가 생깁니다:
        1. 수명 관리 불가 -> 	dispose()를 직접 호출해야 함, 안 하면 메모리 누수
        2. 깊은 트리에서 접근 불가 -> 손자 위젯에서 쓰려면 계속 파라미터로 전달해야 함 (prop drilling)
        3. 테스트 어려움 -> 외부에서 mock Cubit을 주입할 수 없음
     */

    /// CounterView가 context.read<CounterCubit>()을 쓸 수 있는 이유 자체가
    /// BlocProvider가 트리에 등록해놨기 때문입니다.
    /// BlocProvider가 없으면 context.read()는 런타임 에러를 냅니다.
    /// BlocProvider는 단순 전달이 아니라 DI(의존성 주입) + 수명 관리 역할을 합니다.
  }
}