import 'package:bank_app/entities/user.dart';
import 'package:bank_app/services/user_repository.dart';
import 'package:firebase_database/firebase_database.dart';

class Balance {
  String user;
  String lasUpdatedTime;
  double balance;
  String userId;

  Balance({this.user, this.balance, this.userId});

  Map<String, dynamic> toJson() {
    final DateTime now = DateTime.now();

    return {
      'user': this.user,
      'userid': this.userId,
      'balance': this.balance,
      'lastUpdate': now.toString()
    };
  }
}

Balance createBalance(record) {
  Map<String, dynamic> attributes = {
    'user': '',
    'userid': '',
    'balance': 0,
    'lastUpdate': ''
  };
  record.forEach((key, value) => {attributes[key] = value});
  Balance balance =
      new Balance(user: attributes['user'], balance: attributes['balance']);

  return balance;
}