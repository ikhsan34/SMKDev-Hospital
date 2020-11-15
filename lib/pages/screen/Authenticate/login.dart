import 'package:flutter/material.dart';
import 'package:hospital/services/auth.dart';
import 'package:hospital/shared/loading.dart';

class Login extends StatefulWidget {

  final Function toggleView;

  Login({this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final Auth _auth = Auth();

  bool _loading = false;
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _error = '';


  @override
  Widget build(BuildContext context) {
    return _loading ? Loading() : Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text('Login',style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(50, MediaQuery.of(context).size.height * 0.3, 50, 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
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
                  child: Text('Login'),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        _loading = true;
                      });
                      dynamic result = await _auth.signInWithEmail(_email, _password);
                      if (result == null) {
                        setState(() {
                          _loading = false;
                          _error = 'Couldn`t login with those credential.';
                        });
                      }
                    }
                  },
                ),
                SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Dont have account ?'),
                    SizedBox(width: 5,),
                    GestureDetector(
                      child: Text('Register here', style: TextStyle(color: Colors.pink),),
                      onTap: () {
                        print('Register Here');
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