import 'package:bank_app/entities/balance.dart';
import 'package:bank_app/entities/user.dart';
import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.reference();

User saveUser(User user) {
  user = _saveUser(user);
  // user.setObject(_saveBalance(user.getObject()));
  return user;
}

User _saveUser(User user) {
  exists(user.userId).then((value) => {
        if (!value)
          {
            // databaseReference
            //     .child('users/')
            //     .child(user.userId)
            //     .child('balances')
            //     .update(user.getObject().toJson()),
            // databaseReference.child('users/').child(user.userId).set(user.toJson()),
            updateUser(user)

          }
        else
          {
            searchUser(user.userId).then((value) => user = value),
          }
      });

  return user;
}

Balance _saveBalance(Balance balance) {
  exists(balance.userId).then((value) => {
        if (!value)
          {
            databaseReference.child('users/').child(balance.userId).set(value),
            databaseReference
                .child('users/')
                .child(balance.userId)
                .child('balances')
                .set(balance.toJson())
          }
        else
          {
            searchBalance(balance.userId).then((value) => balance = value),
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
  user.getObject().lasUpdatedTime = DateTime.now().toString();
  databaseReference.child('users/' + user.userId).update(user.toJson());
  databaseReference.child('users/' + user.userId + '/balances').update(user.getObject().toJson());
}

Future<Balance> searchBalance(String userId) async {
  DataSnapshot dataSnapshot =
      await databaseReference.child('users/' + userId + '/balances').once();
  Balance balance;

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      balance = createBalance(value);
    });
  }

  return balance;
}

Future<User> searchUser(String userId) async {
  DataSnapshot dataSnapshot =
      await databaseReference.child('users/' + userId).once();
  User user;

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, record) {
      user = createUser(record);
    });
  }

  return user;
}


