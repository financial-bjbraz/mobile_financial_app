import 'package:bank_app/entities/balance.dart';
import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference saveBalance(Balance balance) {
  var id = databaseReference.child('balances/').push();
  id.set(balance.toJson());
  return id;
}

void updateBalance(Balance balance, DatabaseReference id) {
  id.update(balance.toJson());
}

Future<List<Balance>> getAll() async {
  DataSnapshot dataSnapshot = await databaseReference.child('balances/').once();
  List<Balance> balances = [];

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Balance balance = createBalance(value);
      balance.setId(databaseReference.child('balances/' + key));
      balances.add(balance);
    });
  }

  return balances;
}
