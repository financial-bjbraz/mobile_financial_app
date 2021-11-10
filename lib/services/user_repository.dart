import 'package:bank_app/entities/balance.dart';
import 'package:bank_app/entities/user.dart';
import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.reference();

User saveUser(User user) {
  user = _saveUser(user);
  return user;
}

User _saveUser(User user) {
  updateUser(user);
  return user;
}

Balance _saveBalance(Balance balance) {
  exists(balance.userid).then((value) =>
  {
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

void updateUser(User user) {
  user.balances.lastUpdate = DateTime.now().toString();
  databaseReference.child('users/' + user.userId).update(user.toJson());
  //databaseReference.child('users/' + user.userId + '/balances').update(user.balances.toJson());
}

Future<Balance> searchBalance(String userId) async {
  DataSnapshot dataSnapshot =
  await databaseReference.child('users/' + userId + '/balances').once();
  Balance balance;

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      final DateTime now = DateTime.now();
      balance = new Balance(balance: 0, lastUpdate: now.toString(), userid: '');
    });
  }

  return balance;
}

Future<User> searchUser(String userId) async {
  DataSnapshot dataSnapshot =
  await databaseReference.child('users/' + userId).once();
  User user;

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
    'balances': {
      'balance': 0,
      'lastUpdate': '',
      'userid': ''
    }
  };

  Map<dynamic, dynamic> attributesBalance = {
    'user': '',
    'userid': '',
    'balance': 0.0,
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


  return new User.recovered
  (
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
      balances: Balance.recovered(balance: attributesBalance['balance'], lastUpdate: attributesBalance['lastUpdate'], userid: attributesBalance['userid']));

}

