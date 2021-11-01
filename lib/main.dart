import 'package:bloc_stream_pattern/src/random_list.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

// 플러터는 처음 시작하면 main 함수를 먼저 찾는다. 시작점
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<WordPair> _suggestions = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RandomList(),
    );
  }
}
