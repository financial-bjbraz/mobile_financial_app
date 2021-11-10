import 'package:bank_app/entities/cards.dart';
import 'package:firebase_database/firebase_database.dart';

final databaseReference = FirebaseDatabase.instance.reference();


void save(Cards cards) {
  databaseReference.child('cards/' + cards.firebaseUser.uid).update(cards.toJson());
}

Future<Cards> search(String userId) async {
  DataSnapshot dataSnapshot =
  await databaseReference.child('cards/' + userId).once();
  Cards cards;

  Map<String, dynamic> attributes = {
    'cardBalance': 0,
    'cardCvc': 0,
    'cardCvv': 0,
    'cardDate': '',
    'cardDigit': 0,
    'cardFlag': '',
    'cardId': 0,
    'cardImage': '',
    'cardLimit': 0,
    'cardLimitRemaining': 0,
    'cardName': '',
    'cardNumber': 0,
    'cardValidity': ''
  };


  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, record) {
        attributes[key] = record;
    });
  }


  return new Cards.recovered
    (
      cardBalance:attributes[''],
      cardCvc:attributes[''],
      cardCvv:attributes[''],
      cardDate:attributes[''],
      cardDigit:attributes[''],
      cardFlag:attributes[''],
      cardId:attributes[''],
      cardImage:attributes[''],
      cardLimit:attributes[''],
      cardLimitRemaining:attributes[''],
      cardName:attributes[''],
      cardNumber:attributes[''],
      cardValidity:attributes['']
  );

}