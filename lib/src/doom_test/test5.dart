
import 'package:flutter/material.dart';

class Test5 extends StatelessWidget {
  const Test5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
              title: const Text("Test5")
          ),
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                      color: Colors.blueAccent,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      child: Center(child: Text("Title content"))),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                      color: Colors.amberAccent,
                      width: double.infinity,
                      child: Center(child: Text("Main content"))),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                        color: Colors.redAccent,
                        width: double.infinity,
                        child: Text("Footer content"))
                ),
              ]
          )
      );
  }
}