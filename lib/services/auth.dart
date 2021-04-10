import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSigin = GoogleSignIn();
final fb = FacebookLogin();
Stream<FirebaseUser> get currentUser => _auth.onAuthStateChanged;
Future<AuthResult> signInWithCredential(AuthCredential credential) => _auth.signInWithCredential(credential);


Future<FirebaseUser> loginFacebook() async {
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
      final AuthCredential credential = FacebookAuthProvider.getCredential(accessToken: fbToken.token);

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

Future<FirebaseUser> siginInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSigin.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
  final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);

  final AuthResult _authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = _authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(currentUser.uid == user.uid);

  return user;
}

Future<void> logout() => _auth.signOut();
