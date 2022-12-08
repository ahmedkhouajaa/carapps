


import 'package:carriderahmed/new_card.dart';
import 'package:carriderahmed/new_vehicle.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'carpage.dart';
import 'home_page.dart';
import 'login_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RentIt',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: NewVehicle(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/homepage': (context) => HomePage(),
        '/carpage': (context) => CarPage()
      },
    );
  }
}


 