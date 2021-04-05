import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThirdCard extends StatefulWidget {
  const ThirdCard({Key key}) : super(key: key);

  @override
  _ThirdCardState createState() => _ThirdCardState();
}

class _ThirdCardState extends State<ThirdCard> {
  bool _buttonPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            "assets/icons/gift-outline.svg",
            color: Colors.grey,
            semanticsLabel: "gift",
          ),
          Column(
            children: [
              Text(
                "Nubank Rewards",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Acumule pontos que nunca expiram e troque por passagens aéreas ou serviços realmente úteis.",
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(width: 0.7, color: Colors.purple[800]),
            ),
            child: RaisedButton(
              child: Text(
                "ATIVE O SEU REWARDS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              textColor: _buttonPressed ? Colors.white : Colors.purple[800],
              disabledTextColor: Colors.white,
              highlightColor: Colors.purple[800],
              onHighlightChanged: (pressed) {
                setState(() {
                  _buttonPressed = pressed;
                });
              },
              color: Colors.transparent,
              onPressed: () {},
              elevation: 0,
              disabledElevation: 0,
              highlightElevation: 0,
              focusElevation: 0,
              hoverElevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}