
import 'package:bloc_stream_pattern/src/english_list/random_list.dart';
import 'package:flutter/material.dart';

import 'stateful_vs_bloc/bloc_pattern/ui/bloc_display_widget.dart';
import 'stateful_vs_bloc/stateful/ui/plus_stateful_display_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
            title: const Text("Bloc / Stream")
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: ElevatedButton(
                child: const Text("영단어 List"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return const RandomList();
                  }));
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                child: const Text("bloc 패턴"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return BlocDisplayWidget();
                  }));
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                child: const Text("기본 stateful"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return PlusStatefulDisplayWidget();
                  }));
                },
              ),
            ),
          ],
        ),
      );
  }
}