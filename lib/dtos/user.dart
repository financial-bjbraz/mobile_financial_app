import 'package:bank_app/entities/balance.dart';
import 'package:bank_app/services/balanceRepository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User {
  String name;
  String email;
  FirebaseUser user;

  User({this.name, this.email}) {
    createNewUserIfNotExists();
  }

  User.n({this.user}) {
    createNewUserIfNotExists();
    this.name = user.displayName;
    this.email = user.email;
  }

  String getName() {
    if (user == null)
      return name;
    else
      return user.displayName;
  }

  void createNewUserIfNotExists() {
    if (this.user != null)
      saveBalance(new Balance(
          user: this.user.displayName, balance: 0, userId: user.uid));
  }
}
