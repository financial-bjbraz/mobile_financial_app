import 'package:bank_app/entities/balance.dart';
import 'package:bank_app/services/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SimpleUser {
  late String name;
  late String email;
  late String userId;

  late String mobileNumber;
  late String cpf;
  late String address;
  late String address1;
  late String address2;
  late String state;
  late String city;
  late String neighborhood;
  late String photo;
  late String geolocalization;

  Balance balances = Balance(balance: "0.00", lastUpdate: "", userid: "");
  late User firebaseUser;

  SimpleUser({required this.name, required this.email}) {
    createNewUserIfNotExists();
  }

  SimpleUser.recovered(
      {required this.name,
      required this.email,
      mobileNumber,
      userId,
      cpf,
      address,
      address1,
      state,
      city,
      neighborhood,
      photo,
      geolocalization,
      Balance? balances});

  SimpleUser.n({required this.firebaseUser}) {
    this.name = firebaseUser.displayName!;
    this.email = firebaseUser.email!;
    this.userId = firebaseUser.uid;

    this.mobileNumber = "(11) 97513-2627";
    this.cpf = "22387750803";
    this.address = "address 1";
    this.address1 = "address complement";
    this.address2 = "other complement";
    this.state = "SP";
    this.city = "São Paulo";
    this.neighborhood = "JD Santa Izabel";
    this.photo = "a photo";
    this.geolocalization = " a geo";
    createNewUserIfNotExists();
  }

  num getBalance() {
    if (balances == null) {
      final DateTime now = DateTime.now();
      balances = new Balance(
          balance: '0.00',
          lastUpdate: now.toString(),
          userid: firebaseUser.uid);
    }
    return double.parse(balances.balance);
  }

  void setBalances(double d) {
    balances.balance += '1.00';
  }

  String? getName() {
    if (firebaseUser == null)
      return name;
    else
      return firebaseUser.displayName;
  }

  void createNewUserIfNotExists() {
    SimpleUser? u = null;
    final DateTime now = DateTime.now();
    if (this.firebaseUser != null) {
      retrieve(this.firebaseUser.uid).then((value) => {
            if (value != null)
              {
                searchUser(this.firebaseUser.uid).then((value) => {
                      u = value,
                      balances = u!.balances,
                    }),
              }
            else
              {
                balances = new Balance(
                    balance: '0.0',
                    lastUpdate: now.toString(),
                    userid: firebaseUser.uid),
                saveUser(this),
              }
          });
    }
  }

  Map<String, dynamic> toJson() {
    final DateTime now = DateTime.now();

    return {
      'name': this.name,
      'email': this.email,
      'mobile_number': this.mobileNumber,
      'address': this.address,
      'address1': this.address1,
      'address2': this.address2,
      'state': this.state,
      'city': this.city,
      'userId': this.city,
      'neighborhood': this.neighborhood,
      'photo': this.photo,
      'geo_localization': this.geolocalization,
      'lastUpdate': now.toString(),
      'balances': {
        'balance': this.balances.balance,
        'userid': this.balances.userid,
        'lastUpdate': now.toString()
      }
    };
  }
}

SimpleUser createUser(record) {
  final DateTime now = DateTime.now();
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
    'balances': {'balance': 0, 'userid': '', 'lastUpdate': now.toString()}
  };
  record.forEach((key, value) => {
        attributes[key] = value,
      });

  return new SimpleUser.recovered(
      name: attributes['name'], email: attributes['email']);
}
