import 'package:flutter/material.dart';
import 'package:hospital/services/auth.dart';
import 'package:hospital/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;

  Register({this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Register> {

  final Auth _auth = Auth();

  bool _loading = false;
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _name = '';
  String _sex;
  String _phone = '';
  String _error = '';


  @override
  Widget build(BuildContext context) {
    return _loading ? Loading() : Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text('Register',style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(50, MediaQuery.of(context).size.height * 0.25, 50, 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: 'Nama'),
                  validator: (value) {
                    return value.isEmpty ? 'Enter a name' : null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _email = _name;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Phone Number'),
                  validator: (value) {
                    return value.isEmpty ? 'Enter a phone number' : null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _email = _phone;
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
                  decoration: InputDecoration(hintText: 'Email'),
                  validator: (value) {
                    return value.isEmpty ? 'Enter an email' : null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Password'),
                  validator: (value) {
                    return value.length < 6 ? 'Enter 6 or more character password' : null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                SizedBox(height: 20,),

                RaisedButton(
                  child: Text('Register'),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        _loading = true;
                      });
                      dynamic result = await _auth.registerWithEmail(_name, _sex, _phone, _email, _password);
                      if (result == null) {
                        setState(() {
                          _loading = false;
                          _error = 'Couldn`t register with those credential.';
                        });
                      }
                    }
                  },
                ),
                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account ?'),
                    SizedBox(width: 5,),
                    GestureDetector(
                      child: Text('Sign in here', style: TextStyle(color: Colors.pink),),
                      onTap: () {
                        print('Login Here');
                        widget.toggleView();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  _error,
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}