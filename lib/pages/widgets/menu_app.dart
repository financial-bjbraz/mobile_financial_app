import 'package:bank_app/pages/widgets/item_menu.dart';
import 'package:flutter/material.dart';

class MenuApp extends StatelessWidget {
  const MenuApp({Key key, this.top, this.showMenu}) : super(key: key);
  final double top;
  final bool showMenu;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 100),
        opacity: showMenu ? 1 : 0,
        child: Container(
            //color: Colors.red,
            height: MediaQuery.of(context).size.height * 0.55,
            child: Column(
              children: <Widget>[
                Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/QR_code_for_mobile_English_Wikipedia.svg/1200px-QR_code_for_mobile_English_Wikipedia.svg.png",
                  height: 100,
                  color: Colors.white,
                ),
                Text.rich(
                  TextSpan(text: "Banco ", children: [
                    TextSpan(
                      text: "260 - Nu Pagamentos S.A",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ]),
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 5,
                ),
                Text.rich(
                  TextSpan(text: "Agência ", children: [
                    TextSpan(
                      text: "0001",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ]),
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 5,
                ),
                Text.rich(
                  TextSpan(text: "Conta ", children: [
                    TextSpan(
                      text: "000000-0",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ]),
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        ItemMenu(
                          icone: Icons.info_outline,
                          text: "Me ajuda",
                        ),
                        ItemMenu(
                          icone: Icons.person_outline,
                          text: "Perfil",
                        ),
                        ItemMenu(
                          icone: Icons.settings,
                          text: "Configurar conta",
                        ),
                        ItemMenu(
                          icone: Icons.credit_card,
                          text: "Configurar cartão",
                        ),
                        ItemMenu(
                          icone: Icons.store_mall_directory,
                          text: "Pedir conta PJ",
                        ),
                        ItemMenu(
                          icone: Icons.phone_android,
                          text: "Configurações do app",
                        ),
                        SizedBox(
                          height: 22.6,
                        ),
                        Container(
                          height: 35,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.7,
                              color: Colors.white54,
                            ),
                          ),
                          child: RaisedButton(
                            color: Colors.purple[800],
                            highlightColor: Colors.transparent,
                            elevation: 0,
                            disabledElevation: 0,
                            highlightElevation: 0,
                            hoverElevation: 0,
                            onPressed: () {},
                            focusElevation: 0,
                            splashColor: Colors.purple[900],
                            child: Text(
                              "SAIR DO APP",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}