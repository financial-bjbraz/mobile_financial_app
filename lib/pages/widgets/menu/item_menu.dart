import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  const ItemMenu({Key key, this.icone, this.text}) : super(key: key);

  final IconData icone;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.7,
            color: Colors.white54,
          ),
          top: BorderSide(
            width: 0.7,
            color: Colors.white54,
          ),
        ),
      ),
      child: RaisedButton(
        color: Color(0x293145),
        highlightColor: Colors.transparent,
        elevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(icone),
                SizedBox(
                  width: 10,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            Icon(
              Icons.chevron_right,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
