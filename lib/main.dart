import 'package:flutter/material.dart';
import 'package:hospital/pages/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hospital/services/database.dart';
import 'package:provider/provider.dart';
import 'package:hospital/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(MultiProvider(
    providers: [
      StreamProvider.value(value: Auth().user), // Authenticate
      StreamProvider.value(value: Database().getNews) // Berita
    ],
      child: MaterialApp(
      home: Dashboard(),
      ),
    ),
  );

}
