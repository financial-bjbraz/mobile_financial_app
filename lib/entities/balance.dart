import 'package:intl/intl.dart';

class Balance {
  late String user;
  late String lastUpdate;
  late String balance;
  late String userid;
  late String formatedBalance;

  Balance(
      {required this.balance, required this.lastUpdate, required this.userid});

  Balance.recovered(
      {required this.balance, required this.lastUpdate, required this.userid});

  String getFormattedBalance() {
    if (balance == null) balance = '0.00';

    return NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 2)
        .format(double.parse(balance));
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
