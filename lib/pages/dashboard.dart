import 'package:flutter/material.dart';
import 'package:hospital/pages/screen/booking.dart';
import 'package:hospital/pages/screen/home.dart';
import 'package:hospital/pages/screen/layanan.dart';
import 'package:hospital/pages/screen/more/about.dart';
import 'package:hospital/pages/screen/more/feedbackview.dart';
import 'package:hospital/pages/screen/more/partner.dart';
import 'package:hospital/pages/screen/profile/profile.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hospital/services/extents_page_view.dart';


class Dashboard extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Dashboard> {

  // Navbar Button Controller
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);


  // Go to Histori after successing booking
  void toHistori() {
    print('ToHistori');
    _pageController.animateToPage(3,duration: Duration(milliseconds: 500), curve: Curves.ease);
    setState(() {
      _currentIndex = 3;
    });
  }


  @override
  Widget build(BuildContext context) {

    if (_currentIndex == 4) {
      setState(() {
        _currentIndex = 3;
      });
    }

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black38,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Layanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.more),
          //   label: 'More',
          // ),
          BottomNavigationBarItem(
            icon: Container(),
            label: ''
          ),
        ],

        onTap: (value) {
          setState(() {
            _currentIndex = value;
            _pageController.animateToPage(value, duration: Duration(milliseconds: 500), curve: Curves.ease);
          });
        },
      ),
      body: ExtentsPageView(
        controller: _pageController,
        children: [
          Home(),
          Layanan(),
          Booking(toHistori: toHistori,),
          Profile(),
          //More()
        ],
        onPageChanged: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        curve: Curves.easeOut,
        children: [
          SpeedDialChild(
            child: Icon(Icons.feedback),
            label: 'Feedback',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return FeedbackView();
                },
              ));
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.card_membership),
            label: 'Partner & Carreer',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Partner();
                },
              ));
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.person_pin),
            label: 'Tentang Kami',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return About();
                },
              ));
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      
    );
  }
}
