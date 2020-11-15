import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hospital/pages/screen/booking/upbooking.dart';
import 'package:hospital/pages/screen/layanan/uplayanan.dart';
import 'package:hospital/services/news.dart';
import 'package:hospital/shared/doctor.dart';
import 'package:provider/provider.dart';
import 'package:responsive_flutter/responsive_flutter.dart';
import 'package:hospital/shared/const.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin{
  
  final List<Doctor> _doctors = doctorList;

  @override
  Widget build(BuildContext context) {
    final news = Provider.of<List<News>>(context) ?? [];
    super.build(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              viewportFraction: 1
            ),
            items: [
            Container(
                width: double.infinity,
                color: Colors.black38,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Sekilas Tentang RS. SMKDEV',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ResponsiveFlutter.of(context).fontSize(3),
                        ),
                      ),
                      SizedBox(height: 10,),

                      Text(
                        'SMKDEV adalah komunitas developer siswa SMK jurusan Rekayasa Perangkat Lunak (RPL), Teknik Komputer dan Jaringan (TKJ) dan Multimedia (MM) dari seluruh Indonesia.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ResponsiveFlutter.of(context).fontSize(2)
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                color: Colors.lightBlue,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Sekilas Tentang UPI',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ResponsiveFlutter.of(context).fontSize(3),
                        ),
                      ),
                      SizedBox(height: 10,),

                      Text(
                        'UPI',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ResponsiveFlutter.of(context).fontSize(2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Temukan Kami',
                    style: TextStyle(
                      fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 20,),
                  Card(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/map.png'), fit: BoxFit.cover),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Card(
                              child: ListTile(
                                contentPadding: EdgeInsets.all(5),
                                dense: true,
                                title: Text('RS SMKDEV',style: TextStyle(fontWeight: FontWeight.bold),),
                                subtitle: Text('Jl. Margacinta No.29, Buah Batu, Kota Bandung'),
                                leading: Image(image: AssetImage('assets/images/leading.png'),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  ListTile(
                    isThreeLine: true,
                    title: Text('Rumah Sakit SMKDEV'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Jl. Margacinta No.29'),
                        Text('Senin - Jumat : 08.00 - 20.00'),
                        Text('Sabtu: 08.00 - 17.00'),
                      ],
                    ),
                  ),
                  ListTile(
                    isThreeLine: true,
                    title: Text('Klinik SMKDEV'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Jl Mars Barat I No. 9'),
                        Text('Senin - Jumat : 08.00 - 20.00'),
                        Text('Sabtu : 08.00 - 13.00'),
                      ],
                    ),
                  ),
                  ListTile(
                    isThreeLine: true,
                    title: Text('BPJS'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Senin - Jumat : 07.00 - 14.00, 16.00 - 19.00'),
                        Text('Sabtu : 07.00 - 12.00'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        // Tentang Kami
        Container(
          color: Colors.blue,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    'Tentang Kami',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ResponsiveFlutter.of(context).fontSize(2.5)
                    ),  
                  ),
                  Spacer(),
                  GestureDetector(
                    child: Text(
                      'Selengkapnya',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ResponsiveFlutter.of(context).fontSize(2)
                      ),
                    ),
                    onTap: () {
                      print('Test');
                    },
                  )
                ],
              ),
              Card(
                elevation: 0,
                child: Image(
                  image: AssetImage('assets/images/tentangrs.jpg'),
                  fit: BoxFit.cover,
                )
              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: _doctors.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Card(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                color: Colors.black38,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: ListTile(
                                title: Text(Doctor(name: _doctors[index].name).name),
                                subtitle: Text(Doctor(specials: _doctors[index].specials).specials, overflow: TextOverflow.ellipsis,),
                                dense: true,
                                isThreeLine: true,
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return UpBooking(doctor: _doctors[index].name, specials: _doctors[index].specials,);
                                    },
                                  ));
                                },
                              )
                            )
                          ],
                        )
                      ),
                    ); 
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20,),

        // Berita Terbaru
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Berita Terbaru',
                style: TextStyle(
                  fontSize: ResponsiveFlutter.of(context).fontSize(2.5),
                  fontWeight: FontWeight.bold
                ),
                ),
              SizedBox(height: 5,),

              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                child: ListView.builder(
                  reverse: true,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: news.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Card(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                color: Colors.black12,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: ListTile(
                                title: Text(news[index].title),
                                subtitle: Text(news[index].content, overflow: TextOverflow.ellipsis,),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return UpLayanan('Fasilitas', news[index].title, news[index].content, '');
                                    },
                                  ));
                                },
                              ),
                            )

                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20,),

        // Kontak & Pengaduan
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Kontak & Pengaduan',
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              SizedBox(height: 10,),

              ListTile(
                leading: Icon(Icons.pin_drop),
                title: Text('Rumah Sakit SMKDev'),
                subtitle: Text('Jl. Margacinta No. 29'),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('info@smk.dev', style: TextStyle(color: Colors.black45),),
              ),
              ListTile(
                leading: Icon(Icons.phone, ),
                title: Text('+622 7000 0000', style: TextStyle(color: Colors.black45),),
              ),
              ListTile(
                leading: Icon(Icons.work),
                title: Text('+622 7000 0000', style: TextStyle(color: Colors.black45),),
              ),

            ],
          ),
        )

        ],
      ),
    );
  }

  @override
  // wantKeepAlive
  bool get wantKeepAlive => true;
}