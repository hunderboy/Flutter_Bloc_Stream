import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/timer_bloc.dart';

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Timer')),
      body: const Stack(
        children: [
          _Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100),
                child: Center(child: _TimerText()),
              ),
              _Actions(),
            ],
          ),
        ],
      ),
    );
  }
}

class _TimerText extends StatelessWidget {
  const _TimerText();

  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final minutesStr = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondsStr = (duration % 60).toString().padLeft(2, '0');
    return Text(
      '$minutesStr:$secondsStr',
      style: Theme.of(context).textTheme.displayLarge?.copyWith(
            color: Colors.white,
          ),
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: switch (state) {
            TimerInitial() => [
                _ActionButton(
                  icon: Icons.play_arrow,
                  onPressed: () => context.read<TimerBloc>().add(
                        TimerStarted(duration: state.duration),
                      ),
                ),
              ],
            TimerRunInProgress() => [
                _ActionButton(
                  icon: Icons.pause,
                  onPressed: () =>
                      context.read<TimerBloc>().add(const TimerPaused()),
                ),
                _ActionButton(
                  icon: Icons.replay,
                  onPressed: () =>
                      context.read<TimerBloc>().add(const TimerReset()),
                ),
              ],
            TimerRunPause() => [
                _ActionButton(
                  icon: Icons.play_arrow,
                  onPressed: () =>
                      context.read<TimerBloc>().add(const TimerResumed()),
                ),
                _ActionButton(
                  icon: Icons.replay,
                  onPressed: () =>
                      context.read<TimerBloc>().add(const TimerReset()),
                ),
              ],
            TimerRunComplete() => [
                _ActionButton(
                  icon: Icons.replay,
                  onPressed: () =>
                      context.read<TimerBloc>().add(const TimerReset()),
                ),
              ],
          },
        );
      },
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: switch (state) {
                TimerInitial() => [Colors.blue.shade600, Colors.blue.shade900],
                TimerRunInProgress() => [
                    Colors.green.shade600,
                    Colors.green.shade900,
                  ],
                TimerRunPause() => [
                    Colors.orange.shade600,
                    Colors.orange.shade900,
                  ],
                TimerRunComplete() => [
                    Colors.red.shade600,
                    Colors.red.shade900,
                  ],
              },
            ),
          ),
        );
      },
    );
  }
}
