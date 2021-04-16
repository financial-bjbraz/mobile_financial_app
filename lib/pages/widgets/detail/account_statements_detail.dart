import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountStatementsDetail extends StatelessWidget {
  bool _showSaldo = false;

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Icon(Icons.attach_money, color: Colors.grey),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Conta",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.purple[800],
        ),
        body: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: <Widget>[
                                Icon(Icons.attach_money, color: Colors.grey),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Conta",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(
                                _showSaldo
                                    ? "assets/icons/eye-outline.svg"
                                    : "assets/icons/eye-off-outline.svg",
                                color: Colors.grey,
                                semanticsLabel: "visualizar",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, top: 20, bottom: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Saldo disponível",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                              _showSaldo
                                  ? Text.rich(
                                      TextSpan(
                                        text: "R\$ 2.500,80",
                                      ),
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 28,
                                      ),
                                    )
                                  : Container(
                                      height: 32,
                                      width: 140,
                                      color: Colors.grey[200]),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.credit_card, color: Colors.grey),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "Compra mais recente em Super Mercado no valor de R\$ 150,99",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey[400],
                              size: 18,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.credit_card, color: Colors.grey),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "Compra mais recente em Super Mercado no valor de R\$ 150,99",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey[400],
                              size: 18,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.credit_card, color: Colors.grey),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "Compra mais recente em Super Mercado no valor de R\$ 150,99",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey[400],
                              size: 18,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.credit_card, color: Colors.grey),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "Compra mais recente em Super Mercado no valor de R\$ 150,99",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey[400],
                              size: 18,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.credit_card, color: Colors.grey),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: Text(
                                "Compra mais recente em Super Mercado no valor de R\$ 150,99",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey[400],
                              size: 18,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  color: Colors.grey[200],
                ),
              ),
            ],
          ),
        ));
  }
}