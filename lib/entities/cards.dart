import 'package:firebase_auth/firebase_auth.dart';

class Cards {
  late num cardBalance;
  late int cardCvc;
  late int cardCvv;
  late String cardDate;
  late int cardDigit;
  late String cardFlag;
  late num cardId;
  late String cardImage;
  late num cardLimit;
  late num cardLimitRemaining;
  late String cardName;
  late num cardNumber;
  late String cardValidity;
  late User firebaseUser;

  Cards.recovered(
      {required this.cardBalance,
      required this.cardCvc,
      required this.cardCvv,
      required this.cardDate,
      required this.cardDigit,
      required this.cardFlag,
      required this.cardId,
      required this.cardImage,
      required this.cardLimit,
      required this.cardLimitRemaining,
      required this.cardName,
      required this.cardNumber,
      required this.cardValidity});

  Cards.n({required this.firebaseUser}) {
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
