import 'package:firebase_auth/firebase_auth.dart';

class Cards {
  num cardBalance;
  int cardCvc;
  int cardCvv;
  String cardDate;
  int cardDigit;
  String cardFlag;
  num cardId;
  String cardImage;
  num cardLimit;
  num cardLimitRemaining;
  String cardName;
  num cardNumber;
  String cardValidity;
  FirebaseUser firebaseUser;

  Cards.recovered({
    this.cardBalance,
    this.cardCvc,
    this.cardCvv,
    this.cardDate,
    this.cardDigit,
    this.cardFlag,
    this.cardId,
    this.cardImage,
    this.cardLimit,
    this.cardLimitRemaining,
    this.cardName,
    this.cardNumber,
    this.cardValidity});

  Cards.n({this.firebaseUser}) {

    this.cardBalance = 0.0;
    this.cardCvc = 1;
    this.cardCvv = 1;
    this.cardDate = '';
    this.cardDigit = 0;
    this.cardFlag = '';
    this.cardId = 0;
    this.cardImage = '';
    this.cardLimit = 1000.00;
    this.cardLimitRemaining = 1000.00;
    this.cardName = '';
    this.cardNumber = 1111111;
    this.cardValidity = '23/10/2029';
  }


  Map<String, dynamic> toJson() {
    return {
      'cardBalance': this.cardBalance,
      'cardCvc': this.cardCvc,
      'cardCvv': this.cardCvv,
      'cardDate': this.cardDate,
      'cardDigit': this.cardDigit,
      'cardFlag': this.cardFlag,
      'cardId': this.cardId,
      'cardImage': this.cardImage,
      'cardLimit': this.cardLimit,
      'cardLimitRemaining': this.cardLimitRemaining,
      'cardName': this.cardName,
      'cardNumber': this.cardNumber,
      'cardValidity': this.cardValidity
    };
  }


}