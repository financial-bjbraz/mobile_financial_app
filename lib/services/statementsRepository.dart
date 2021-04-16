import 'package:bank_app/entities/balance.dart';
import 'package:bank_app/entities/statements.dart';
import 'package:bank_app/services/dataBases.dart';
import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference saveBalance(Statements statements) {
  var id = databaseReference.child(DataBase.STATEMENTS+statements.userId).push();
  id.set(statements.toJson());
  return id;
}

void updateBalance(Balance balance, DatabaseReference id) {
  id.update(balance.toJson());
}

Future<List<Balance>> getAll(String userId) async {
  DataSnapshot dataSnapshot = await databaseReference.child(DataBase.STATEMENTS+userId).once();
  List<Balance> balances = [];

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Balance balance = createBalance(value);
      balances.add(balance);
    });
  }

  return balances;
}
