import 'package:bank_app/entities/simple_user.dart';
import 'package:bank_app/services/user_repository.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class Balance {
  String user;
  String lastUpdate;
  String balance;
  String userid;
  String formatedBalance;

  Balance({this.balance, this.lastUpdate, this.userid});

  Balance.recovered({this.balance, this.lastUpdate, this.userid});

  String getFormattedBalance(){

    if(balance == null)
      balance = '0.00';

    return NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2).format(double.parse(balance));
  }

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

