import 'package:flutter/material.dart';
import 'package:hospital/pages/screen/layanan/search.dart';
import 'package:hospital/pages/screen/layanan/uplayanan.dart';
import 'package:hospital/services/news.dart';
import 'package:hospital/shared/doctor.dart';
import 'package:hospital/shared/facility.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:hospital/shared/const.dart';

class Layanan extends StatelessWidget {

  final List<Facility> _facilities = facilities;
  
  @override
  Widget build(BuildContext context) {

    final news = Provider.of<List<News>>(context) ?? [];

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Test', style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                TextField(
                  showCursor: false,
                  autofocus: false,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Seacrh dokter, fasilitas & layanan'
                  ),
                  onTap: () {
                    showSearch(context: context, delegate: Search(news));
                  },

                ),
                SizedBox(height: 20,),

                // Fasilitas & Layanan Terkini
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: _facilities.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return UpLayanan('Fasilitas', _facilities[index].title, _facilities[index].description, _facilities[index].date);

                            },
                          )
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Card(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3,
                              color: Colors.black45,
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(Doctor(name: _facilities[index].title).name, style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20,),

                // Event & Promo
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Event & Promo',
                      style: TextStyle(
                        fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10,),


                    ListView.builder(
                      reverse: true,
                      itemCount: news.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.2,
                                color: Colors.black45,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                child: ListTile(
                                  isThreeLine: true,
                                  title: Text(news[index].title, style: TextStyle(fontWeight: FontWeight.bold,),),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Text(news[index].type, style: TextStyle(color: Colors.blue, fontSize: 15),),
                                      Text(news[index].content,),
                                      SizedBox(height: 5,),
                                      Text(DateFormat('yyyy-MM-dd').format(news[index].createdAt.toDate())
                                        , style: TextStyle(color: Colors.black38),
                                      )
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return UpLayanan('Promo & Events', news[index].title, news[index].content, DateFormat('yyyy-MM-dd').format(news[index].timeEvent));
                                      },
                                    ));
                                  },
                                )
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}