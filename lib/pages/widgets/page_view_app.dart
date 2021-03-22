import 'package:bank_app/pages/widgets/first_card.dart';
import 'package:bank_app/pages/widgets/second_cart.dart';
import 'package:flutter/material.dart';

import 'card_app.dart';

class PageViewApp extends StatelessWidget {
  final double top;
  final ValueChanged<int> onChanged;
  final GestureDragUpdateCallback onPanUpdated;
  final bool showMenu;

  const PageViewApp(
      {Key key, this.top, this.onChanged, this.onPanUpdated, this.showMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(microseconds: 250),
      curve: Curves.easeOut,
      left: 0,
      right: 0,
      top: top,
      height: MediaQuery.of(context).size.height * .45,
      //width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onPanUpdate: onPanUpdated,
        child: PageView(
          onPageChanged: onChanged,
          physics: showMenu
              ? NeverScrollableScrollPhysics()
              : BouncingScrollPhysics(),
          children: <Widget>[
            CardApp(
              child: FirstCard(),
            ),
            CardApp(
              child: SecondCard(),
            ),
            CardApp(),
          ],
        ),
      ),
    );
  }
}
