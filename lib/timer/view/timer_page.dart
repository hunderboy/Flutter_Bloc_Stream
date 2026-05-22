import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/timer_bloc.dart';
import '../ticker.dart';
import 'timer_view.dart';

/**
 * 파일 생성 순서
 *  0. TimerPage
    1. Ticker
    2. TimerState (1.Bloc 을 만들기 전에 State 작성)
    3. TimerEvent (2.Bloc 을 만들기 전에 Event 작성)
    4. TimerBloc
 */
class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: const Ticker()),
      child: const TimerView(),
    );
  }
}
