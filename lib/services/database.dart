import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hospital/services/account.dart';
import 'package:hospital/services/news.dart';


class Database {

  final String uid;

  Database({ this.uid });

  // Collection reference
  final CollectionReference profile = FirebaseFirestore.instance.collection('profile');
  final CollectionReference news = FirebaseFirestore.instance.collection('news');

  Future updateUserData(String name, String sex, String phone) async {
    return await profile.doc(uid).set({
      'name': name,
      'sex': sex,
      'phone': phone
    });
  }

  Future updateBookingData(String doctor, String specials, DateTime time, String message, String isNew) async {
    return await profile.doc(uid).collection('booking').doc().set({
      'doctor': doctor,
      'specials': specials,
      'time': time,
      'message': message,
      'isNew': isNew,
      'createdAt': Timestamp.now()
    });
  }

  Future updateNotif() async {
    await profile.doc(uid).collection('booking').get()
    .then((value) => value.docs.forEach((element) {
      element.reference.update({
        'isNew': ''
      });
    }));
  }

  Future createPosting(String type, String title, String content, DateTime timeEvent) async {
    return await news.doc().set({
      'type': type,
      'title': title,
      'content': content,
      'timeEvent': timeEvent,
      'createdAt': Timestamp.now()
    });
  }

  // News List
  List<News> _news(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return News(
        type: e.data()['type'] ?? '',
        title: e.data()['title'] ?? '',
        timeEvent: e.data()['timeEvent'].toDate() ?? '',
        content: e.data()['content'] ?? '',
        createdAt: e.data()['createdAt'],
      );
    }).toList();
  }

  // Booking List
  List<BookingData> _booking(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      return BookingData(
        doctor: e.data()['doctor'] ?? '',
        specials: e.data()['specials'] ?? '',
        time: e.data()['time'].toDate() ?? '',
        message: e.data()['message'] ?? '',
        isnew: e.data()['isNew'] ?? 'New',
      );
    }).toList();
  }

  // user data from snapshot
  AccountData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return AccountData(
      uid: uid,
      name: snapshot.data()['name'],
      sex: snapshot.data()['sex'],
      phone: snapshot.data()['phone'],
    );
  }

  // BookingData _bookingDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return BookingData(
  //     //uid: uid,
  //     doctor: snapshot.data()['doctor'],
  //     specials: snapshot.data()['specials'],
  //     time: snapshot.data()['time'].toDate(),
  //     message: snapshot.data()['message'],
  //     isnew: snapshot.data()['isNew']
  //   );
  // }

  // get user doc stream
  Stream<AccountData> get userData {
    return profile.doc(uid).snapshots()
    .map((event) => _userDataFromSnapshot(event));
  }

  // Booking
  Stream<List<BookingData>> get bookings {
    return profile.doc(uid).collection('booking').orderBy('createdAt').snapshots()
    .map((event) => _booking(event));
  }

  // NEws
  Stream<List<News>> get getNews {
    return news.orderBy('createdAt').snapshots()
    .map((event) => _news(event));
  }

  // Stream<BookingData> get bookingData {
  //   return profile.doc(uid).collection('booking').doc(uid).snapshots()
  //   .map((event) => _bookingDataFromSnapshot(event));
  // }

}