import 'package:flutter/material.dart';

import '../bloc/count_bloc.dart';

class CountView extends StatelessWidget {
  CountView({Key? key, required this.countBloc}) : super(key: key);

  CountBloc countBloc;

  @override
  Widget build(BuildContext context) {
    print("CountView Build!!");
    return Center(
      child: StreamBuilder( // StreamBuilder 사용
        stream: countBloc.count,
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          if (snapshot.hasData) {
            return Text(
              snapshot.data.toString(),
              style: const TextStyle(
                fontSize:50
              )
            );
          }
          return const CircularProgressIndicator();
        }
      )
    );
  }
}
