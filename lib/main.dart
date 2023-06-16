import 'package:fctech_inc_task/src/app/pages/home/home_view.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FcTech Inc',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
