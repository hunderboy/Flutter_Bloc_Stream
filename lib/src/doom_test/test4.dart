
import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  final Function(String searchText) onSearchHandle;
  const SearchInput({Key? key, required this.onSearchHandle}) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    _searchTextController.addListener(() {
      int nameLength = _searchTextController.text.length;

      if (nameLength > 2){
        widget.onSearchHandle(_searchTextController.text);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Test4")
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: const InputDecoration(hintText:  "Please input text.."),
            controller: _searchTextController,
          )
        ]
      )
    );
  }
}

// class Test4 extends  {
//   final Function(String searchText) onSeearchHandle;
//   const Test4({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Scaffold(
//           appBar: AppBar(
//               title: const Text("Test4")
//           ),
//           body: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 TextField(
//                   decoration: const InputDecoration(hintText:  " dfd"),
//                   controller: _searchTextController,
//                 )
//               ]
//           )
//       );
//   }
// }