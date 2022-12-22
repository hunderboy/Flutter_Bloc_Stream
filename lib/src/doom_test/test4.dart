
import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  final Function(String searchText) onSeearchHandle;
  const SearchInput({Key? key, required this.onSeearchHandle}) : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final _searchTextController = TextEditingController();

  @override
  void initState() {


    // TODO: implement initState
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
        appBar: AppBar(
            title: const Text("Test4")
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(hintText:  " dfd"),
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