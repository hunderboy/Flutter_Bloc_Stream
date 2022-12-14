import 'package:flutter/material.dart';

import 'src/home.dart';

// 플러터는 처음 시작하면 main 함수를 먼저 찾는다. 시작점
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
