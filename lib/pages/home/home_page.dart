import 'package:bank_app/pages/widgets/card_app.dart';
import 'package:bank_app/pages/widgets/my_app_bar.dart';
import 'package:bank_app/pages/widgets/page_view_app.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showMenu;
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          MyAppBar(
            showMenu: _showMenu,
            onTap: () {
              setState(() {
                _showMenu = !_showMenu;
              });
            },
          ),
          PageViewApp(
            top: _heightScreen * .24,
            onChanged: (index) {
              _currentIndex = index;
            },
          ),
          Positioned(
            child: Row(
              children: <Widget>[
                Container(
                    height: 7,
                    width: 7,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
