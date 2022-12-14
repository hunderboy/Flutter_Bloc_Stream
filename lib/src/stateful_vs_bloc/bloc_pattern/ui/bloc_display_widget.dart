import 'package:flutter/material.dart';

import '../bloc/count_bloc.dart';
import '../components/count_view.dart';

class BlocDisplayWidget extends StatefulWidget {
  BlocDisplayWidget({Key? key}) : super(key: key);

  @override
  _BlocDisplayWidgetState createState() => _BlocDisplayWidgetState();
}

class _BlocDisplayWidgetState extends State<BlocDisplayWidget> {
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
      body: CountView(countBloc: countBloc),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          countBloc.add();
        },
      ),
    );
  }
}
