import 'package:bank_app/entities/simple_user.dart';
import 'package:bank_app/pages/home/home_page.dart';
import 'package:bank_app/pages/home/transactions_page.dart';
import 'package:bank_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Container(
      child: Scaffold(
        backgroundColor: const Color(0x293145),
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String MESSAGE_INVALID_EMAIL = "Invalid email";
  String MESSAGE_INVALID_PASSWORD =
      "Invalid Password. Password must not be least than 8 chars";

  TextEditingController passwordController = new TextEditingController();
  TextEditingController mailController = new TextEditingController();
  late User user;
  late bool _buttonPressed = false;
  late String _email, _password;
  final auth = FirebaseAuth.instance;

  Widget loginButton() {
    FocusNode textSecondFocusNode = new FocusNode();

    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Colors.grey[300],
      minimumSize: Size(88, 36),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "", //AppLocalizations.of(context).title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
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
                        ElevatedButton(
                          onPressed: () {
                            if (validate()) {
                              auth.signInWithEmailAndPassword(
                                  email: mailController.text,
                                  password: passwordController.text);

                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => TransactionsPage(
                                            user: new SimpleUser(
                                                name: mailController.text,
                                                email: mailController.text),
                                          )));
                            }
                          },
                          style: raisedButtonStyle,
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
                        ElevatedButton(
                          onPressed: () {
                            if (validate()) {
                              auth.createUserWithEmailAndPassword(
                                  email: mailController.text,
                                  password: passwordController.text);
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => TransactionsPage(
                                            user: new SimpleUser(
                                                name: mailController.text,
                                                email: mailController.text),
                                          )));
                            }
                          },
                          style: raisedButtonStyle,
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Text.rich(
                    TextSpan(
                      text: "Or ",
                    ),
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  OutlinedButton(
                    onPressed: this.clickLoginGoogle,
                    style: raisedButtonStyle,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/google_logo.png",
                            color: Colors.white,
                            height: 30,
                            width: 90,
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
                  OutlinedButton(
                    onPressed: this.clickLoginFacebook,
                    style: raisedButtonStyle,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/fb_logo5.png",
                            color: Colors.white,
                            height: 30,
                            width: 70,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Sign in with facebook",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              color: Color(0x293145),
            ),
          ),
        ],
      ),
    );
  }

  void clickLoginGoogle() {
    siginInWithGoogle().then((value) => {
          this.user = value!,
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                user: new SimpleUser.n(firebaseUser: this.user),
              ),
            ),
          ),
        });
  }

  void clickLoginFacebook() {
    loginFacebook().then((value) => {
          this.user = value!,
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                user: new SimpleUser.n(firebaseUser: this.user),
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
    var email = mailController.text;
    var password = passwordController.text;
    var message = "";

    if (email.isEmpty) {
      showMessage(MESSAGE_INVALID_EMAIL);
      return false;
    }

    if (password.isEmpty) {
      showMessage(MESSAGE_INVALID_PASSWORD);
      return false;
    }

    if (password.length < 8) {
      showMessage(MESSAGE_INVALID_PASSWORD);
      return false;
    }

    return true;
  }

  void showMessage(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: 'Ok',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
