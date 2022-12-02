import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class AdminMain extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _mainState();
}

class _mainState extends State<AdminMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          child: Center(
              child: Text(
            "Админ - властитель этого 'Page'",
            style: TextStyle(color: Colors.white, fontSize: 35),
          )),
        ),
      ),
    );
  }
}
