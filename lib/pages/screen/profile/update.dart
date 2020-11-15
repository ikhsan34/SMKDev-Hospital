import 'package:flutter/material.dart';
import 'package:hospital/services/database.dart';
import 'package:provider/provider.dart';
import 'package:hospital/services/account.dart';

class Update extends StatefulWidget {
  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {

  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _sex;
  String _phone = '';

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Account>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(50, MediaQuery.of(context).size.height * 0.25 , 50, 0),
          child: StreamBuilder(
            stream: Database(uid: user.uid).userData,
            builder: (context, snapshot) {
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        return value.isEmpty ? 'Please input a name' : null;
                      },
                      decoration: InputDecoration(hintText: 'Masukan Nama'),
                      onChanged: (value) {
                        setState(() {
                          _name = value;
                        });
                      },
                    ),
                    DropdownButton(
                      isExpanded: true,
                      hint: Text('Jenis Kelamin'),
                      value: _sex,
                      
                      items: [
                        DropdownMenuItem(
                          child: Text('Laki-laki'),
                          value: 'Laki-laki',
                        ),
                        DropdownMenuItem(
                          child: Text('Perempuan'),
                          value: 'Perempuan',
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _sex = value;
                        });
                      },
                    ),

                    TextFormField(
                      validator: (value) {
                        return value.isEmpty? 'Please input a correct number' : null;
                      },
                      decoration: InputDecoration(hintText: 'Nomor Telepon'),
                      onChanged: (value) {
                        setState(() {
                          _phone = value;
                        });
                      },
                    ),
                    SizedBox(height: 10,),
                    RaisedButton(
                      child: Text('Update'),
                      onPressed: () async {
                        if(_formKey.currentState.validate()) {
                          await Database(uid: user.uid).updateUserData(_name, _sex, _phone);
                          Navigator.pop(context);
                        }
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}