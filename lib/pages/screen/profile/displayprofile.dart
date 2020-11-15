import 'package:flutter/material.dart';
import 'package:hospital/pages/screen/profile/histori.dart';
import 'package:hospital/pages/screen/profile/notifikasi.dart';
import 'package:hospital/pages/screen/profile/posting.dart';
import 'package:hospital/pages/screen/profile/update.dart';
import 'package:hospital/services/auth.dart';
import 'package:hospital/services/database.dart';
import 'package:provider/provider.dart';
import 'package:hospital/services/account.dart';

class DisplayProfile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<DisplayProfile> with TickerProviderStateMixin{

  final Auth _auth = Auth();

  TabController _tabController;
  int _currentIndex = 0;
  List _tab = [
    Notifikasi(),
    Histori()
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    print('dispose');
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Account>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  color: Colors.blue,
                  //child: Text('Profile'),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.17,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.03,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                          color: Colors.white
                        ),
                        alignment: Alignment.topRight,
                      ),
                    ],
                  ),
                ),

                PositionedDirectional(
                  top: MediaQuery.of(context).size.height * 0.11,
                  start: 100,
                  end: 100,
                  child: Container(
                    //color: Colors.orange,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image(
                            image: AssetImage('assets/profile.jpg'),
                            height: MediaQuery.of(context).size.height * 0.12,
                          ),
                        ),
                        //SizedBox(height: 5,),

                        // Profile
                        StreamBuilder<AccountData>(
                          stream: Database(uid: user.uid).userData,
                          builder: (context, snapshot) {
                            if(snapshot.hasData) {
                              AccountData profile = snapshot.data;
                              return ListTile(
                                title: Center(
                                  child: Text(profile.name ?? 'null'),
                                ),
                                subtitle: Center(
                                  child: Column(
                                    children: [
                                      Text(profile.sex),
                                      Text(profile.phone)
                                    ],
                                  ),
                                ),
                                isThreeLine: true,
                              );

                            } else {
                              return Container();
                            }
                          },
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width * 0.9,
              //color: Colors.orange,
              alignment: Alignment.topRight,
              child: PopupMenuButton(
                onSelected: (value) {
                  switch (value) {
                    case 0:
                      _auth.logout();
                      break;

                    case 1:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Update(),));
                      break;
                    case 2:
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Posting(),));
                      break;
                  }
                },
                itemBuilder: (_) => [
                  PopupMenuItem(
                    value: 0,
                    child: Text('Logout'),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Text('Update Profile'),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text('Create Post'),
                  )
                ],
              )
            ),

            // TabBar
            Container(
              width: MediaQuery.of(context).size.width,
              child: TabBar(
                onTap: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },

                labelPadding: EdgeInsets.all(20),
                tabs: [
                  Text('Notifikasi',style: TextStyle(color: Colors.blue),),
                  Text('Histori Booking',style: TextStyle(color: Colors.blue),)
                ],
                controller: _tabController,
              ),
            ),
            SizedBox(height: 0,),


            Container(
              child: StreamProvider.value(
                value: Database(uid: user.uid).bookings,
                child: _tab.elementAt(_currentIndex),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

