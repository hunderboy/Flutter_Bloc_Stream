import 'package:bloc/bloc.dart';
import 'package:bloc_stream_pattern/counter_observer.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  Bloc.observer = const CounterObserver(); // CounterObserver 초기화
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
