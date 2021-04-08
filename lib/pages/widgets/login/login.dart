import 'package:bank_app/dtos/user.dart';
import 'package:bank_app/pages/home/home_page.dart';
import 'package:bank_app/pages/home/transactions_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/services/auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.purple[800],
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController passwordController = new TextEditingController();
  TextEditingController mailController = new TextEditingController();
  FirebaseUser user;
  bool _buttonPressed = false;
  String _email, _password;
  final auth = FirebaseAuth.instance;

  Widget loginButton() {
    FocusNode textSecondFocusNode = new FocusNode();
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Bank App Login",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: this.mailController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: "Type Your E-mail:",
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 5, color: Colors.white)),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.done),
                              splashColor: Colors.white,
                              tooltip: "Submit",
                              onPressed: () {
                                FocusScope.of(context)
                                    .requestFocus(textSecondFocusNode);
                              },
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        focusNode: textSecondFocusNode,
                        obscureText: true,
                        controller: this.passwordController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: "Type Your Password:",
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 5, color: Colors.white),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.done),
                              splashColor: Colors.white,
                              tooltip: "Submit",
                              onPressed: () {},
                            )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            if (validate()) {
                              auth.signInWithEmailAndPassword(
                                  email: mailController.text,
                                  password: passwordController.text);

                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => TransactionsPage(
                                            user: new User(
                                                name: mailController.text,
                                                email: mailController.text),
                                          )));
                            }
                          },
                          color: Colors.purple[800],
                          highlightColor: Colors.transparent,
                          elevation: 0,
                          disabledElevation: 0,
                          highlightElevation: 0,
                          hoverElevation: 0,
                          child: Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.create),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Login",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.chevron_right,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            auth.createUserWithEmailAndPassword(
                                email: mailController.text,
                                password: passwordController.text);
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => TransactionsPage(
                                          user: new User(
                                              name: mailController.text,
                                              email: mailController.text),
                                        )));
                          },
                          color: Colors.purple[800],
                          highlightColor: Colors.transparent,
                          elevation: 0,
                          disabledElevation: 0,
                          highlightElevation: 0,
                          hoverElevation: 0,
                          child: Row(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.login_rounded),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Create account",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.chevron_right,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ]),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  Text.rich(
                    TextSpan(
                      text: "Or ",
                    ),
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  OutlineButton(
                    onPressed: this.click,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45)),
                    splashColor: Colors.purple[800],
                    borderSide: BorderSide(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/google_logo.png",
                            color: Colors.white,
                            height: 35,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Sign in with google",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ],
              ),
              color: Colors.purple[800],
            ),
          ),
        ],
      ),
    );
  }

  void click() {
    siginInWithGoogle().then((value) => {
          this.user = value,
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                user: new User.n(user: this.user),
              ),
            ),
          ),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: loginButton(),
    );
  }

  bool validate() {
    final snackBar = SnackBar(
      content: Text('Yay! A SnackBar!'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    return false;
  }
}