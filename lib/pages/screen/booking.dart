import 'package:flutter/material.dart';
import 'package:hospital/pages/screen/booking/upbooking.dart';
import 'package:hospital/shared/doctor.dart';
import 'package:hospital/shared/const.dart';

class Booking extends StatelessWidget {

  // To Histori Function Called from dashboard
  final Function toHistori;

  Booking({this.toHistori});


  @override
  Widget build(BuildContext context) {

    final List<Doctor> _doctors = doctorList;

    return Scaffold(
      appBar: AppBar(
        title: Text('Booking',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView.builder(
        itemCount: _doctors.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(_doctors[index].name),
              subtitle: Text(_doctors[index].specials),
              onTap: () async {
                final result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UpBooking(doctor: _doctors[index].name, specials: _doctors[index].specials,); },
                ));
                print(result);

                // To Histori Function
                if(result == true) {
                  this.toHistori();
                }

              },
            ),
          );
        },
      ),
    );
  }
}