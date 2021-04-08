import 'package:bank_app/dtos/user.dart';
import 'package:bank_app/pages/widgets/bottom_menu/bottom_menu.dart';
import 'package:bank_app/pages/widgets/menu/menu_app.dart';
import 'package:bank_app/pages/widgets/page_view/my_app_bar.dart';
import 'package:bank_app/pages/widgets/page_view/my_dots_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  final User user;

  const TransactionsPage({Key key, this.user}) : super(key: key);

  @override
  _TransactionsPageState createState() => _TransactionsPageState(user);
}

class _TransactionsPageState extends State<TransactionsPage> {
  bool _showMenu;
  int _currentIndex;
  double _yPosition;
  final User _user;

  _TransactionsPageState(this._user);

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _heightScreen = MediaQuery.of(context).size.height;

    if (_yPosition == null) {
      _yPosition = _heightScreen * .24;
    }
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          MyAppBar(
            showMenu: _showMenu,
            userName: _user.name,
            onTap: () {
              setState(() {
                _showMenu = !_showMenu;
                _yPosition =
                    _showMenu ? _heightScreen * .75 : _heightScreen * .24;
              });
            },
          ),
          MenuApp(
            top: _heightScreen * .205,
            showMenu: _showMenu,
          ),
          BottomMenu(
            showMenu: _showMenu,
          ),
          MyDotsApp(
            showMenu: _showMenu,
            top: _heightScreen * .70,
            currentIndex: _currentIndex,
          ),
        ],
      ),
    );
  }
}
