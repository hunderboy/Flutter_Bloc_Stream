import 'package:flutter/material.dart';

import '../bloc/count_bloc.dart';
import '../components/count_view.dart';

class BlocDisplayWidget extends StatefulWidget {
  BlocDisplayWidget({Key? key}) : super(key: key);

  @override
  _BlocDisplayWidgetState createState() => _BlocDisplayWidgetState();
}

class _BlocDisplayWidgetState extends State<BlocDisplayWidget> {

  // bloc 객체는 해당 bloc 객체가 필요한 최상위 지점에서 생성한다.
  final CountBloc countBloc = CountBloc();

  @override
  void dispose() {
    super.dispose();
    countBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("bloc 패턴"),
      ),
      body: CountView(countBloc: countBloc), // 위젯을 생성하면서 파라미터로 bloc 객체 전달
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          countBloc.add();
        },
      ),
    );
  }
}
