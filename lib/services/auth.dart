import 'package:bank_app/pages/widgets/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSigin = GoogleSignIn();
final fb = FacebookLogin();
Stream<User> get currentUser => _auth.authStateChanges(); //_auth.onAuthStateChanged;
Future<UserCredential> signInWithCredential(AuthCredential credential) => _auth.signInWithCredential(credential);


Future<User> loginFacebook() async {
  print('Starting facebook login');

  final res = await fb.logIn(
    permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
      FacebookPermission.userBirthday
    ]
  );

  switch(res.status){
    case FacebookLoginStatus.Success:
      print('It worked');

      //Get Token
      final FacebookAccessToken fbToken = res.accessToken;

      //Convert to Auth Credential
      final AuthCredential credential = FacebookAuthProvider.credential(fbToken.token);


      //User Credential to Sigin in with Firebase
      final result = await _auth.signInWithCredential(credential);

      print('${result.user.displayName} is now logged in');

      return result.user;

    break;
    case FacebookLoginStatus.Cancel:
      print('The user cancelled the login');
    break;
    case FacebookLoginStatus.Error:
      print('There was an error');
    break;
  }

}

Future<User> siginInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSigin.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
  final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);

  final UserCredential _authResult = await _auth.signInWithCredential(credential);
  final User user = _authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final User currentUser = await _auth.currentUser;
  assert(currentUser.uid == user.uid);

  return user;
}

Future<void> logout(BuildContext context) {
  _auth.signOut().then((value) => {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    )
  });
}
