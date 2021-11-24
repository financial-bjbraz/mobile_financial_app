import 'package:firebase_database/firebase_database.dart';

class Statements {
  late String date;
  late double value;
  late String message;
  late String accountId;
  late bool updated = false;
  late String userId;
  late DatabaseReference _id;

  Statements(
      {required this.date,
      required this.value,
      required this.message,
      required this.accountId});

  void update() {
    updated = true;
    _id.update(this.toJson());
  }

  Map<String, dynamic> toJson() {
    final DateTime now = DateTime.now();

    return {
      'value': this.value,
      'date': now.toString(),
      'message': this.message,
      'account_id': this.accountId,
      'updated': updated
    };
  }
}

Statements create(record) {
  Map<String, dynamic> attributes = {
    'value': '',
    'date': '',
    'message': '',
    'account_id': '',
    'updated': ''
  };
  record.forEach((key, value) => {attributes[key] = value});
  Statements post = new Statements(
      value: attributes['value'],
      date: attributes['date'],
      message: attributes['message'],
      accountId: attributes['account_id']);

  return post;
}
