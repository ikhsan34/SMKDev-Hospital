import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hospital/services/account.dart';
import 'package:hospital/services/database.dart';
import 'package:provider/provider.dart';

class Histori extends StatefulWidget {

  @override
  _HistoriState createState() => _HistoriState();
}

class _HistoriState extends State<Histori> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animation = ColorTween(begin: Colors.black, end: Colors.transparent).animate(_animationController);
    _animationController.forward();

  }

  @override
  void dispose() {
    print('dispose');
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    final bookings = Provider.of<List<BookingData>>(context) ?? [];
    final user = Provider.of<Account>(context);


    return ListView.builder(
      reverse: true,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        Future.delayed(Duration(seconds: 5),(){
          Database(uid: user.uid).updateNotif();
        });
        return ListTile(
          title: Text(bookings[index].doctor),
          subtitle: Text(bookings[index].specials),
          trailing: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Container(
                child: Text(bookings[index].isnew, style: TextStyle(color: _animation.value),),
              );
            },
          )
        );
      },
    );
  }
}
