import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'saved.dart';
import 'bloc/Bloc.dart';

class RandomList extends StatefulWidget {
  const RandomList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RandomListState();
}

class _RandomListState extends State<RandomList> {

  final List<WordPair> _suggestions = <WordPair>[]; // 단어 배열

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("naming app"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SavedList())
                );
              }
            )
          ]
        ),
        body: _buildList()
    );
  }


  Widget _buildList() {
    return StreamBuilder<Set<WordPair>>(
      stream: bloc.savedStream,
      builder: (context, snapshot) {  // snapshot 은 데이터가 변경되서 올때마다 오는 데이터 지칭한다.
        return ListView.builder(itemBuilder: (context, index) {
          // 0 2 4 6 8 = real items
          // 1 3 5 7 9 = dividers
          if (index.isOdd) {
            // 홀수면
            return const Divider();
          }
          var realIndex = index ~/ 2; // index를 2로 나눈 몫
          if (realIndex >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }

          return _bulidRow(snapshot.data, _suggestions[realIndex]);
        });
      }
    );
  }


  Widget _bulidRow(Set<WordPair>? saved , WordPair pair) {

    final bool alreadySaved = saved==null ? false : saved.contains(pair);

    return ListTile(
      title: Text(pair.asPascalCase, textScaleFactor: 1.5),
      trailing: Icon(
        alreadySaved?
        Icons.favorite: Icons.favorite_border,
        color: Colors.pink,
      ),
      onTap: () {
        // 더이상 setState 는 필요가 없다.
        bloc.addToOrRemoveFromSavedList(pair);
      },
    );
  }
}
