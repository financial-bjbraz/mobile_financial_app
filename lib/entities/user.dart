import 'package:bank_app/entities/balance.dart';
import 'package:bank_app/services/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User {
  String name;
  String email;
  String userId;

  String mobileNumber;
  String cpf;
  String address;
  String address1;
  String address2;
  String state;
  String city;
  String neighborhood;
  String photo;
  String geolocalization;

  Balance _balance;
  FirebaseUser firebaseUser;

  User({this.name, this.email}) {
    createNewUserIfNotExists();
  }

  User.recovered({this.name, this.email});

  User.n({this.firebaseUser}) {

    this.name = firebaseUser.displayName;
    this.email = firebaseUser.email;
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

  double getBalance() {

    if(_balance == null){
      _balance = new Balance(balance: 0, userId: firebaseUser.uid);
      setObject(_balance);
    }

    return _balance.balance;
  }

  void setBalance(double d) {
    _balance.balance += d;
  }

  Balance getObject() {
    return _balance;
  }

  void setObject(Balance b) {
    _balance = b;
  }

  String getName() {
    if (firebaseUser == null)
      return name;
    else
      return firebaseUser.displayName;
  }

  void createNewUserIfNotExists() {
    User u = null;

    if(this.firebaseUser != null) {
      searchUser(this.firebaseUser.uid).then((value) =>
        {
          u = value,
          _balance = new Balance(balance: 0, userId: firebaseUser.uid),
          setObject(_balance),
        }
      );

    }else{
      _balance = new Balance(balance: 0, userId: firebaseUser.uid);
      setObject(_balance);
      saveUser(this);
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
      'neighborhood': this.neighborhood,
      'photo': this.photo,
      'geo_localization': this.geolocalization,
      'lastUpdate': now.toString()
    };
  }
}


User createUser(record) {
  Map<String, dynamic> attributes = {
    'name': '',
    'email':'',
    'mobile_number': '',
    'address': '',
    'address1': '',
    'address2': '',
    'state': '',
    'city': '',
    'neighborhood': '',
    'photo':'',
    'geo_localization': '',
    'lastUpdate':''
  };
  record.forEach((key, value) => {attributes[key] = value});
  return new User.recovered(name: attributes['name'], email: attributes['email']);
}
