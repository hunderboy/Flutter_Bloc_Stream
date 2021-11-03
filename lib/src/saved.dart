import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'bloc/Bloc.dart';

class SavedList extends StatefulWidget {

  @override
  _SavedListState createState() => _SavedListState();
}

class _SavedListState extends State<SavedList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Saved"),
        ),
        body: _buildList()
    );
  }

  Widget _buildList() {
    return StreamBuilder<Set<WordPair>>(
      stream: bloc.savedStream,
      builder: (context, snapshot) {
        var saved = Set<WordPair>();

        // final bool alreadySaved =
        // saved==null? false : // saved 가 null 이면 기본 false
        // saved.contains(pair); // null 이 아니면 포함여부에 따라 t/f

        if(snapshot.hasData){
          saved.addAll(snapshot.data!);
        }else{
          bloc.addCurrentSaved;
        }

        return ListView.builder(
            itemCount: snapshot.data!.length * 2,
            itemBuilder: (context, index) {
              if (index.isOdd) return Divider(); // 1 3 5 7

              var realIndex = index ~/ 2;

              return _buildRow(saved.toList()[realIndex]); // 0 2 4 6 8
            });
      }
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        textScaleFactor: 1.5,
      ),
      onTap: () {
        bloc.addToOrRemoveFromSavedList(pair);
      },
    );
  }
}
