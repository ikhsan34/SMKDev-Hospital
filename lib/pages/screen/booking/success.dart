import 'package:flutter/material.dart';

class Success extends StatefulWidget {

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle,color: Colors.white,size: MediaQuery.of(context).size.width * 0.3,),
            Text('Booking Success!', style: TextStyle(color: Colors.white, fontSize: 30),),
            SizedBox(height: 5,),
            Text('Kode booking anda', style: TextStyle(color: Colors.white, fontSize: 20),),
            Text('B1029381', style: TextStyle(color: Colors.white, fontSize: 20),),
            SizedBox(height: 5,),
            RichText(
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
              text: TextSpan(text: 'Customer Service akan menghubungi anda untuk konfirmasi selanjutnya'),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
              child: Text('Lihat Histori',style: TextStyle(color: Colors.blueAccent),),
              onPressed: () {
                print('Histori');
                Navigator.pop(context, true);
                
              },
            ),
            FlatButton(
              color: Colors.transparent,
              child: Text('Tidak, Kembali ke home',style: TextStyle(color: Colors.white54),),
              onPressed: () {
                print('Home');
                Navigator.pop(context, 'Home');
                
              },
            ),
          ],
        ),
      )
    );
  }
}