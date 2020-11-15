import 'package:flutter/material.dart';

class UpLayanan extends StatelessWidget {

  final String type;
  final String title;
  final String description;
  final String date;

  const UpLayanan(this.type, this.title, this.description, this.date);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.type),
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
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(this.type, style: TextStyle(color: Colors.lightBlue),),

                  ListTile(
                    title: Text(this.title),
                    subtitle: Text(this.date),
                  ),
                  SizedBox(height: 20,),

                  RichText(
                    text: TextSpan(
                      text: this.description,
                      style: TextStyle(color: Colors.black45)
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}