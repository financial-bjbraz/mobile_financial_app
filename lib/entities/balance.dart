import 'package:bank_app/entities/simple_user.dart';
import 'package:bank_app/services/user_repository.dart';
import 'package:firebase_database/firebase_database.dart';

class Balance {
  String user;
  String lastUpdate;
  num balance;
  String userid;

  Balance({this.balance, this.lastUpdate, this.userid});

  Balance.recovered({this.balance, this.lastUpdate, this.userid});

  Map<String, dynamic> toJson() {
    final DateTime now = DateTime.now();

    return {
      'user': this.user,
      'userid': this.userid,
      'balance': this.balance,
      'lastUpdate': now.toString()
    };
  }
}

