import 'package:flutter/material.dart';
import '../consensusItem.dart';

class SecondApp extends StatelessWidget {
  final List<Consensus> list;
  SecondApp({Key key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('두번째 페이지'),
        ),
      ),
    );
  }
}
