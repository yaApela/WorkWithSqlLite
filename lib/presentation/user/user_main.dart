import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _userMainState();
}

class _userMainState extends State<UserMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          child: Center(
              child: Text(
                "Пользователь - позволено Админом пользоваться этим 'Page'",
                style: TextStyle(color: Colors.white, fontSize: 35),
              )),
        ),
      ),
    );
  }
}
