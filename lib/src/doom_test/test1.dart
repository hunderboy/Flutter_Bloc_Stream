

import 'package:flutter/material.dart';

class Test1 extends StatelessWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
              title: const Text("Test5")
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('asd'),
                    const Text('asd'),
                    const Text('asd'),
                  ],
                )
              ],
            ),
          )
      );
  }
}
