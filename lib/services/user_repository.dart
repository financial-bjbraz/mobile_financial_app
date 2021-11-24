import 'package:bank_app/entities/balance.dart';
import 'package:bank_app/entities/simple_user.dart';
import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.reference();

SimpleUser saveUser(SimpleUser user) {
  user = _saveUser(user);
  return user;
}

SimpleUser _saveUser(SimpleUser user) {
  updateUser(user);
  return user;
}

Balance _saveBalance(Balance balance) {
  exists(balance.userid).then((value) => {
        if (!value)
          {
            databaseReference.child('users/').child(balance.userid).set(value),
            databaseReference
                .child('users/')
                .child(balance.userid)
                .child('balances')
                .set(balance.toJson())
          }
        else
          {
            searchBalance(balance.userid).then((value) => balance = value),
          }
      });

  return balance;
}

Future<bool> exists(String userId) async {
  DataSnapshot dataSnapshot =
      await databaseReference.child('users/' + userId + '/balances').once();
  return dataSnapshot.value != null;
}

void updateUser(SimpleUser user) {
  user.balances.lastUpdate = DateTime.now().toString();
  databaseReference.child('users/' + user.userId).update(user.toJson());
  //databaseReference.child('users/' + user.userId + '/balances').update(user.balances.toJson());
}

Future<Balance> searchBalance(String userId) async {
  DataSnapshot dataSnapshot =
      await databaseReference.child('users/' + userId + '/balances').once();
  Balance balance = Balance(balance: "0.00", lastUpdate: "", userid: "");

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      if (key == "balance") {
        final DateTime now = DateTime.now();
        balance =
            new Balance(balance: value, lastUpdate: now.toString(), userid: '');
      }
    });
  }

  return balance;
}

Future<Balance> retrieve(String userId) async {
  DataSnapshot dataSnapshot =
      await databaseReference.child('users/' + userId + '/balances').once();
  Balance balance = Balance(balance: "0.00", lastUpdate: "", userid: "");

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      if (key == "balance") {
        final DateTime now = DateTime.now();
        balance =
            new Balance(balance: value, lastUpdate: now.toString(), userid: '');
      }
    });
  }

  return balance;
}

Future<num> getBalance(String userId) async {
  return searchBalance(userId).then((value) => double.parse(value.balance));
}

Future<SimpleUser> searchUser(String userId) async {
  DataSnapshot dataSnapshot =
      await databaseReference.child('users/' + userId).once();
  SimpleUser user;

  Map<String, dynamic> attributes = {
    'name': '',
    'cpf': '',
    'email': '',
    'mobile_number': '',
    'address': '',
    'address1': '',
    'address2': '',
    'state': '',
    'city': '',
    'neighborhood': '',
    'photo': '',
    'geo_localization': '',
    'lastUpdate': '',
    'userId': '',
    'balances': {'balance': '0.00', 'lastUpdate': '', 'userid': ''}
  };

  Map<dynamic, dynamic> attributesBalance = {
    'user': '',
    'userid': '',
    'balance': '0.00',
    'lastUpdate': ''
  };

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, record) {
      if (key == 'balances') {
        attributesBalance = record;
      } else {
        attributes[key] = record;
      }
    });
  }

  return new SimpleUser.recovered(
      name: attributes['name'],
      email: attributes['email'],
      mobileNumber: attributes['mobile_number'],
      userId: attributes['userId'],
      cpf: attributes['cpf'],
      address: attributes['address'],
      address1: attributes['address1'],
      state: attributes['state'],
      city: attributes['city'],
      neighborhood: attributes['neighborhood'],
      photo: attributes['photo'],
      geolocalization: attributes['geo_localization'],
      balances: Balance.recovered(
          balance: attributesBalance['balance'],
          lastUpdate: attributesBalance['lastUpdate'],
          userid: attributesBalance['userid']));
}
