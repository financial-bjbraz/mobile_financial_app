import 'package:bank_app/pages/widgets/login/login.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    super.initState();
    delay();
  }

  Future<void> delay() async {
    return await Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation animation,
              Animation secondaryAnimation) {
            return LoginPage();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(41, 49, 69, 20),
          body: Center(
            child: Image.asset(
              "assets/images/bjbraz-logo.png",
              color: Colors.white,
              height: 50,
            ),
          )),
    );
  }
}
