import 'package:flutter/material.dart';
import 'package:hospital/services/database.dart';
import 'package:intl/intl.dart';

class Posting extends StatefulWidget {
  @override
  _PostingState createState() => _PostingState();
}

class _PostingState extends State<Posting> {

  // Form
  GlobalKey _key = GlobalKey<FormState>();
  String _radioTile = 'promo';
  String _title = '';
  String _content = '';

  // DateTime
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
    }
  );
}

  @override
  Widget build(BuildContext context) {

    String formatedDate = DateFormat('dd-MM-yy').format(selectedDate);

    datePick() {
      if(_radioTile == 'event') {
        return ListTile(
          title: Text('Tanggal Event', style: TextStyle(fontWeight: FontWeight.bold),),
          trailing: IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              _selectDate(context);
            },
          ),
          subtitle: Text(formatedDate),
        );
      } else {return Container();}
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Posting'),
        backgroundColor: Colors.black12,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Column(
            children: [
              RadioListTile(
                groupValue: _radioTile,
                value: 'promo',
                title: Text('Promo'),
                onChanged: (value) {
                  setState(() {
                    _radioTile = value;
                  });
                },
              ),
              RadioListTile(
                groupValue: _radioTile,
                value: 'event',
                title: Text('Event'),
                onChanged: (value) {
                  setState(() {
                    _radioTile = value;
                  });
                },
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Judul',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                      onChanged: (value) {
                        setState(() {
                          _title = value;
                        });
                      },
                    ),
                    SizedBox(height: 20,),

                    TextFormField(
                      minLines: 2,
                      maxLines: 10,
                      decoration: InputDecoration(
                        labelText: 'Konten',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                      onChanged: (value) {
                        setState(() {
                          _content = value;
                        });
                      },
                    ),
                    SizedBox(height: 20,),

                    Container(
                      child: datePick(),
                    ),
                    SizedBox(height: 20,),

                    ElevatedButton(
                      child: Text('Submit'),
                      onPressed: () async{
                        print(_radioTile);
                        print(_title);
                        print(_content);
                        print(selectedDate);

                        await Database().createPosting(_radioTile, _title, _content, selectedDate);
                        Navigator.pop(context);

                      },
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}