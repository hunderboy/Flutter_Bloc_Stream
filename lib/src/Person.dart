import 'package:flutter/material.dart';


enum Status {login, logout}
class Goblin implements Monster {
  var authStatus = Status.logout;

  void checkAuthStatus(Status status) {
    switch (authStatus){
      case Status.login:
        print('로그인 상태');
        break;
      case Status.logout:
        print('로그아웃 상태');
        break;
    }
  }

}

class DarkGoblin extends Goblin with Hero {
}



