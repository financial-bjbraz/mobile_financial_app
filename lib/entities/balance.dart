import 'package:bank_app/services/balanceRepository.dart';
import 'package:firebase_database/firebase_database.dart';

class Balance {
  String user;
  String lasUpdatedTime;
  double balance;
  String userId;
  DatabaseReference _id;

  Balance({this.user, this.balance, this.userId});

  void setId(DatabaseReference id) {
    this._id = id;
  }

  DatabaseReference getId() {
    return this._id;
  }

  void update() {
    lasUpdatedTime = DateTime.now().toString();
    updateBalance(this, this._id);
  }

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
