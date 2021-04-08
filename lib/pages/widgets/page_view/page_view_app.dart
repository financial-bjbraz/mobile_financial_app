import 'package:bank_app/dtos/user.dart';
import 'package:bank_app/pages/widgets/cards/first_card.dart';
import 'package:bank_app/pages/widgets/cards/second_cart.dart';
import 'package:bank_app/pages/widgets/cards/third_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../cards/card_app.dart';

class PageViewApp extends StatefulWidget {
  final double top;
  final ValueChanged<int> onChanged;
  final GestureDragUpdateCallback onPanUpdated;
  final bool showMenu;
  final User user;

  const PageViewApp(
      {Key key,
      this.top,
      this.onChanged,
      this.onPanUpdated,
      this.showMenu,
      this.user})
      : super(key: key);

  @override
  _PageViewAppState createState() => _PageViewAppState(user);
}

class _PageViewAppState extends State<PageViewApp> {
  Tween _tween;
  final User user;

  _PageViewAppState(this.user);

  @override
  void initState() {
    super.initState();
    _tween = Tween<double>(begin: 150.0, end: 0.0);

    ///delayAnimation();
  }

  Future<void> delayAnimation() async {
    Future.delayed(Duration(milliseconds: 0), () {
      setState(() {
        _tween = Tween<double>(begin: 150.0, end: 0.0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
        tween: _tween,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOutExpo,
        builder: (context, value, child) {
          return AnimatedPositioned(
            duration: Duration(microseconds: 250),
            curve: Curves.easeOut,
            left: value,
            right: value * -1,
            top: widget.top,
            height: MediaQuery.of(context).size.height * .45,
            //width: MediaQuery.of(context).size.width,
            child: GestureDetector(
              onPanUpdate: widget.onPanUpdated,
              child: PageView(
                onPageChanged: widget.onChanged,
                physics: widget.showMenu
                    ? NeverScrollableScrollPhysics()
                    : BouncingScrollPhysics(),
                children: <Widget>[
                  CardApp(
                    child: FirstCard(),
                  ),
                  CardApp(
                    child: SecondCard(),
                  ),
                  CardApp(
                    child: ThirdCard(displayName: user.name),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
