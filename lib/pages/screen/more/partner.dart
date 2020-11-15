import 'package:flutter/material.dart';
import 'package:hospital/pages/screen/layanan/uplayanan.dart';
import 'package:hospital/services/news.dart';
import 'package:hospital/shared/doctor.dart';
import 'package:hospital/shared/partnerclass.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:hospital/shared/const.dart';

class Partner extends StatefulWidget {
  @override
  _PartnerState createState() => _PartnerState();
}

class _PartnerState extends State<Partner> {

  final List<PartnerClass> _partnerList = partnerList;

  @override
  Widget build(BuildContext context) {

    final news = Provider.of<List<News>>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Partner'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: Center(child: Text('Partner', style: TextStyle(fontWeight: FontWeight.bold),),),
              ),
              SizedBox(height: 10,),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: _partnerList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return UpLayanan('Fasilitas', _partnerList[index].title, _partnerList[index].description, _partnerList[index].date);

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
                              child: Text(Doctor(name: _partnerList[index].title).name, style: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20,),

              ListTile(
                title: Center(child: Text('Lowongan', style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
              ListView.builder(
                reverse: true,
                itemCount: news.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(10)),
                            color: Colors.black45
                          ),
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          child: ListTile(
                            isThreeLine: true,
                            title: Text(news[index].title, style: TextStyle(fontWeight: FontWeight.bold,),),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Partner', style: TextStyle(color: Colors.blue, fontSize: 15),),
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
                                  return UpLayanan('Partner', news[index].title, news[index].content, DateFormat('yyyy-MM-dd').format(news[index].timeEvent));
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
          ),
        ),
      ),
    );
  }
}