import 'package:bank_app/pages/widgets/item_menu_botton.dart';
import 'package:bank_app/pages/widgets/menu_app.dart';
import 'package:bank_app/pages/widgets/my_app_bar.dart';
import 'package:bank_app/pages/widgets/my_dots_app.dart';
import 'package:bank_app/pages/widgets/page_view_app.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showMenu;
  int _currentIndex;
  double _yPosition;

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
          PageViewApp(
            showMenu: _showMenu,
            top: _yPosition,
            onChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            onPanUpdated: (details) {
              double positionBottonLimit = _heightScreen * .75;
              double positionTopLimit = _heightScreen * .24;
              double middlePosition = positionBottonLimit - positionTopLimit;
              middlePosition = middlePosition / 2;

              setState(() {
                _yPosition += details.delta.dy;

                _yPosition = _yPosition < positionTopLimit
                    ? positionTopLimit
                    : _yPosition;

                _yPosition = _yPosition > positionBottonLimit
                    ? positionBottonLimit
                    : _yPosition;

                if (_yPosition != positionBottonLimit && details.delta.dy > 0) {
                  _yPosition =
                      _yPosition > positionTopLimit + middlePosition - 50
                          ? positionBottonLimit
                          : _yPosition;
                }

                if (_yPosition != positionTopLimit && details.delta.dy < 0) {
                  _yPosition = _yPosition < positionBottonLimit - middlePosition
                      ? positionTopLimit
                      : _yPosition;
                }

                if (_yPosition == positionBottonLimit) {
                  _showMenu = true;
                } else if (_yPosition == positionTopLimit) {
                  _showMenu = false;
                }
              });
            },
          ),
          MyDotsApp(
            showMenu: _showMenu,
            top: _heightScreen * .70,
            currentIndex: _currentIndex,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            bottom: !_showMenu ? 0 + MediaQuery.of(context).padding.bottom : 0,
            left: 0,
            right: 0,
            height: _heightScreen * 0.14,
            child: IgnorePointer(
              ignoring: _showMenu,
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: !_showMenu ? 1 : 0,
                child: Container(
                  color: Colors.purple[800],
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      ItemMenuBottom(
                        icon: Icons.person_add,
                        text: "indicar amigos",
                      ),
                      ItemMenuBottom(
                        icon: Icons.phone_android,
                        text: "Recarga de celular",
                      ),
                      ItemMenuBottom(
                        icon: Icons.chat,
                        text: "Cobrar",
                      ),
                      ItemMenuBottom(
                        icon: Icons.monetization_on,
                        text: "Empréstimos",
                      ),
                      ItemMenuBottom(
                        icon: Icons.move_to_inbox,
                        text: "Depositar",
                      ),
                      ItemMenuBottom(
                        icon: Icons.mobile_screen_share,
                        text: "Transferir",
                      ),
                      ItemMenuBottom(
                        icon: Icons.format_align_center,
                        text: "Ajustar limite",
                      ),
                      ItemMenuBottom(
                        icon: Icons.chrome_reader_mode,
                        text: "Pagar",
                      ),
                      ItemMenuBottom(
                        icon: Icons.lock_open,
                        text: "Bloquear",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
