import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'saved.dart';

class RandomList extends StatefulWidget {
  const RandomList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RandomListState();
}

class _RandomListState extends State<RandomList> {
  final List<WordPair> _suggestions = <WordPair>[]; // 단어 배열
  final Set<WordPair> _saved = Set<WordPair>(); // '좋아요'한 단어 set

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("naming app"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.list),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SavedList(saved: _saved))
                );
              }
            )
          ],
        ),
        body: _buildList());
  }

  Widget _buildList() {
    return ListView.builder(itemBuilder: (context, index) {
      // 0 2 4 6 8 = real items
      // 1 3 5 7 9 = dividers
      if (index.isOdd) {
        // 홀수면
        return Divider();
      }
      var realIndex = index ~/ 2; // index를 2로 나눈 몫
      if (realIndex >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }

      return _bulidRow(_suggestions[realIndex]);
    });
  }

  Widget _bulidRow(WordPair pair) {
    final bool alreadySaved =
        _saved.contains(pair); // Saved 안에 pair 라는 단어가 있냐 없냐

    return ListTile(
      title: Text(pair.asPascalCase, textScaleFactor: 1.5),
      trailing: Icon(
        alreadySaved?
        Icons.favorite: Icons.favorite_border,
        color: Colors.pink,
      ),
      onTap: () {
        setState(() { // setState 는 상태가 변경됨을 적용시켜준다.
          if (alreadySaved) {
          _saved.remove(pair);
          } else {
          _saved.add(pair);
          } // false

          print(_saved.toString());
        });
      },
    );
  }
}
