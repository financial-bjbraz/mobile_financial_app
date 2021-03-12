import 'package:flutter/material.dart';

class MyDotsApp extends StatelessWidget {
  const MyDotsApp({Key key, this.currentIndex}) : super(key: key);

  final int currentIndex;

  getColor(int index) {
    return index != currentIndex ? Colors.white38 : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: 7,
          width: 7,
          decoration: BoxDecoration(
            color: getColor(0),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: 7,
          width: 7,
          decoration: BoxDecoration(
            color: getColor(1),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: 8,
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: 7,
          width: 7,
          decoration: BoxDecoration(
            color: getColor(2),
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
