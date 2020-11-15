import 'package:flutter/material.dart';

class About extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Kami'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.black38,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    isThreeLine: true,
                    title: Text('Sekilas Tentang SMKDev', style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 5,),
                        RichText(
                          textScaleFactor: 1.1,
                          text: TextSpan(
                            text: 'SMKDev adalah komunitas developer siswa SMK jurusan Rekayasa Perangkat Lunak (RPL), Teknik Komputer dan Jaringan (TKJ), dan Multimedia (MM) dari seluruh Indonesia. Mereka adalah talenta yang bersemangat dan luar biasa berbakat serta kompetitif. Mereka bergabung untuk meningkatkan skill coding, menunjukkan keahlian dan siap merealisasikan kebutuhan aplikasi untuk bisnis Anda.',
                            style: TextStyle(color: Colors.black45, wordSpacing: 2)
                          ),
                        ),
                      ],
                    )
                  ),
                  SizedBox(height: 20,),

                  Icon(Icons.pin_drop_rounded,color: Colors.blue, size: MediaQuery.of(context).size.width * 0.3,),
                  Column(
                    children: [
                      ListTile(
                        title: Center(child: Text('Temukan Kami', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                      ),
                      ListTile(
                        title: Center(child: Text('Rumah Sakit SMKDev')),
                        subtitle: Center(child: Text('Jl Margacinta No. 29')),
                      ),
                      ListTile(
                        title: Center(child: Text('Klinik SMKDev')),
                        subtitle: Center(child: Text('Jl Mars Barat I No. 9')),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),

                  Icon(Icons.healing_outlined ,color: Colors.blue, size: MediaQuery.of(context).size.width * 0.3,),
                  Column(
                    children: [
                      ListTile(
                        title: Center(child: Text('Layanan Darurat', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                      ),
                      ListTile(
                        title: Center(child: Text('Unit Gawat Darurat')),
                        subtitle: Center(child: Text('Setiap Hari 24 Jam')),
                      ),
                      ListTile(
                        isThreeLine: true,
                        title: Center(child: Text('Ambulans Siaga')),
                        subtitle: Column(
                          children: [
                            Center(child: Text('+622 7000 0000')),
                            Center(child: Text('+622 7000 0000'))
                          ],
                        ),
                      ),
                      ListTile(
                        title: Center(child: Text('Telepon')),
                        subtitle: Center(child: Text('+62813 0000 0000')),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),

                  Icon(Icons.lock_clock, color: Colors.blue, size: MediaQuery.of(context).size.width * 0.3,),
                  Column(
                    children: [
                      ListTile(
                        title: Center(child: Text('Waktu Operasional', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                      ),
                      ListTile(
                        isThreeLine: true,
                        title: Center(child: Text('Rumah Sakit')),
                        subtitle: Column(
                          children: [
                            Center(child: Text('Senin - Jumat : 08.00 - 20.00')),
                            Center(child: Text('Sabtu: 08.00 - 17.00'))
                          ],
                        ),
                      ),
                      ListTile(
                        isThreeLine: true,
                        title: Center(child: Text('Klinik')),
                        subtitle: Column(
                          children: [
                            Center(child: Text('Senin - Jumat : 08.00 - 20.00')),
                            Center(child: Text('Sabtu : 08.00 - 13.00'))
                          ],
                        ),
                      ),
                      ListTile(
                        isThreeLine: true,
                        title: Center(child: Text('BPJS')),
                        subtitle: Column(
                          children: [
                            Center(child: Text('Senin - Jumat : 07.00 - 14.00, 16.00 - 19.00')),
                            Center(child: Text('Sabtu : 07.00 - 12.00'))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),

                  
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}