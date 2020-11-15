class Account {

  final String uid;
  final String email;

  Account({ this.uid, this.email });

}

class AccountData {

  final String uid;
  final String email;
  final String name;
  final String sex;
  final String phone;

  AccountData({ this.uid, this.name, this.sex, this.phone, this.email });


}

class BookingData {

  final String doctor;
  final String specials;
  final DateTime time;
  final String message;
  final String isnew;

  BookingData({this.specials ,this.doctor, this.time, this.message, this.isnew});

}

