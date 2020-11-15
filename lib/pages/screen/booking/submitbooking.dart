import 'package:flutter/material.dart';
import 'package:hospital/pages/screen/booking/success.dart';
import 'package:hospital/services/account.dart';
import 'package:hospital/services/database.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class SubmitBooking extends StatefulWidget {

  final String doctor;
  final String specials;
  const SubmitBooking({Key key, this.doctor, this.specials});

  @override
  _SubmitBookingState createState() => _SubmitBookingState();
}

class _SubmitBookingState extends State<SubmitBooking> {
  
  DateTime selectedDate = DateTime.now();
  _selectDate(BuildContext context) async {
  final DateTime picked = await showDatePicker(
    context: context,
    initialDate: selectedDate, 
    firstDate: DateTime.now(),
    lastDate: DateTime(2030),
  );
  if (picked != null && picked != selectedDate)
    setState(() {
      selectedDate = picked;
    });
}
  
  String _pesan;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Account>(context);
    String formatedDate = DateFormat('dd-MM-yy').format(selectedDate);

    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Confirm'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                leading: Icon(Icons.person),
                title: Text(widget.doctor),
                subtitle: Text(widget.specials),
              ),
              Divider(height: 20,),

              ListTile(
                title: Text('Booking Detail', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                color: Colors.black12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    StreamBuilder(
                      stream: Database(uid: user.uid).userData,
                      builder: (context, snapshot) {
                        if(snapshot.hasData) {
                          AccountData account = snapshot.data;
                          return ListTile(
                            isThreeLine: true,
                            title: Text('Booking Untuk'),
                            trailing: Text('Ganti Pasien',style: TextStyle(color: Colors.blue),),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Nama : ${account.name}'),
                                Text('Jenis Kelamin : ${account.sex}'),
                                Text('Status : Saya sendiri'),
                              ],
                            ),
                          );
                        } else {
                          print('No Data');
                          return Container(
                            child: Text('No Data'),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text('Booking Tanggal', style: TextStyle(fontWeight: FontWeight.bold),),
                trailing: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
                subtitle: Text(formatedDate),
              ),
              ListTile(
                isThreeLine: true,
                title: Text('Pesan', style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Pesan',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Colors.black12)
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: Colors.black12)
                      )
                    ),
                    onChanged: (value) {
                      setState(() {
                        _pesan = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
        child: ElevatedButton(
          child: Text('Konfirmasi'),
          onPressed: () async {
            print(formatedDate);
            print(_pesan);
            await Database(uid: user.uid).updateBookingData(widget.doctor,widget.specials, selectedDate, _pesan, 'New');
            final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => Success(),));
            if(result == true) {
              Navigator.pop(context,true);
            } else {
              Navigator.pop(context);
            }
          },
        ),
      )
    );
  }
}