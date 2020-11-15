import 'package:flutter/material.dart';
import 'package:hospital/pages/screen/Authenticate/login.dart';
import 'package:hospital/pages/screen/booking/submitbooking.dart';
import 'package:hospital/services/account.dart';
import 'package:hospital/services/auth.dart';
import 'package:provider/provider.dart';

class UpBooking extends StatefulWidget {

  final String doctor;
  final String specials;

  const UpBooking({this.doctor, this.specials});

  @override
  _UpBookingState createState() => _UpBookingState();
}

class _UpBookingState extends State<UpBooking> {

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

    final user = Provider.of<Account>(context);

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                floating: true,
                pinned: true,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(widget.doctor),
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  title: Text('Jadwal',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 10,),
                      Text('Senin',style: TextStyle(fontWeight: FontWeight.bold),),
                      Row(
                        children: [
                          Text('08.00 - 14.00 WIB'),
                          Spacer(),
                          Text('SMKDev')
                        ],
                      ),
                      Text('Selasa',style: TextStyle(fontWeight: FontWeight.bold),),
                      Row(
                        children: [
                          Text('08.00 - 14.00 WIB'),
                          Spacer(),
                          Text('SMKDev')
                        ],
                      ),
                      Text('Rabu',style: TextStyle(fontWeight: FontWeight.bold),),
                      Row(
                        children: [
                          Text('08.00 - 14.00 WIB'),
                          Spacer(),
                          Text('SMKDev')
                        ],
                      ),
                    ],
                  ),
                  isThreeLine: true,
                ),
                ListTile(
                  title: Text('Biografi',style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                  subtitle: Text('Lorem ipsum dolor'),
                ),
                ListTile(
                  title: Text('Kredensial',style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                  subtitle: Text('Lorem ipsum dolor'),
                ),
                ListTile(
                  title: Text('Afliansi Akademik',style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                  subtitle: Text('Lorem ipsum dolor'),
                ),
              ],
            ),
          )
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 50),
        child: ElevatedButton(
          child: Text('Buat Janji'),
          onPressed: () async {
            if(user == null) {
              register();

            } else {
              final result = await Navigator.push(context, MaterialPageRoute(
                builder: (context) => SubmitBooking(doctor: widget.doctor, specials: widget.specials,),
              ));
              if (result == true) {
                Navigator.pop(context,result);
              } else {
                Navigator.pop(context);
              }
            }
            
          },
        ),
      )
    );

    
  }
  register() {
    return showModalBottomSheet(
      clipBehavior: Clip.none,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
      ),
      context: context,
      builder: (context) {
        return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: SingleChildScrollView(
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      subtitle: Text('Silahkan registrasi untuk membuat janji dengan dokter.'),
                    ),
                    Form(
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
                                _name = value;
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
                                _phone = value;
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
                                dynamic result = await _auth.registerWithEmail(_name, _sex, _phone, _email, _password);
                                if (result == null) {
                                  setState(() {
                                    _error = 'Couldn`t register with those credential.';
                                  }
                                  );
                                } else {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SubmitBooking(doctor: widget.doctor, specials: widget.specials,),));
                                }
                              }
                            },
                          ),
                          SizedBox(height: 10,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account ?'),
                              SizedBox(width: 5,),
                              GestureDetector(
                                child: Text('Sign in here', style: TextStyle(color: Colors.pink),),
                                onTap: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),

                          Text(
                            _error,
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                    )
                  ],
                ),
            ),
          ),
        );
      },
    );
  }
  
}

