import 'dart:async';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class Bloc{
  Set<WordPair> saved = <WordPair>{};

  final _savedController = StreamController<Set<WordPair>>.broadcast();

  get savedStream => _savedController.stream;

  get addCurrentSaved => _savedController.sink.add(saved);

  // 데이터 추가 or 삭제
  addToOrRemoveFromSavedList(WordPair item){
    if(saved.contains(item)){
      saved.remove(item);
    }else{
      saved.add(item);
    }

    _savedController.sink.add(saved);
  }


  dispose(){  // 메모리 릭이 발생하지 않게
    _savedController.close(); // 메모리에서 해제
  }
}


var bloc = Bloc(); // static 으로 만드는 방식.