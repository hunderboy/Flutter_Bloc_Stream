
import 'package:bloc_stream_pattern/src/english_list/random_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'doom_test/test1.dart';
import 'doom_test/test2.dart';
import 'doom_test/test3.dart';
import 'doom_test/test4.dart';
import 'doom_test/test5.dart';
import 'stateful_vs_bloc/bloc_pattern/ui/bloc_display_widget.dart';
import 'stateful_vs_bloc/stateful/ui/plus_stateful_display_widget.dart';
import 'doom_test/test_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String getPerson(String text){
    if (kDebugMode) {
      print("Hi. My name is Thierry Henry");
    }
    return "Hi. My name is Thierry Henry";
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
            title: const Text("Bloc / Stream")
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ElevatedButton(
            //   style: const ButtonStyle(
            //     backgroundColor: MaterialStatePropertyAll<Color>(Colors.redAccent),
            //   ),
            //   child: const Text("Test1"),
            //   onPressed: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (_) {
            //       return const Test1();
            //     }));
            //   },
            // ),
            // ElevatedButton(
            //   style: const ButtonStyle(
            //     backgroundColor: MaterialStatePropertyAll<Color>(Colors.redAccent),
            //   ),
            //   child: const Text("Test2"),
            //   onPressed: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (_) {
            //       return const Test2();
            //     }));
            //   },
            // ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.redAccent),
              ),
              child: const Text("Test3"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return ProductDatails(detailsText: "상세내용", visible: false);
                }));
              },
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.redAccent),
              ),
              child: const Text("Test4"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  /// 파라미터가 Funcion 이라 함수명 그대로 할당
                  return SearchInput(onSearchHandle:getPerson);
                }));
              },
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.redAccent),
              ),
              child: const Text("Test5"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const Test5();
                }));
              },
            ),

/// ----------------------------------------------------------------------------------------
            Center(
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
                ),
                child: const Text("Test Page"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return const TestPage();
                  }));
                },
              ),
            ),
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