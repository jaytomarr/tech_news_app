import 'package:flutter/material.dart';
import 'package:tech_news_app/pages/home.dart';

void main() {
  return runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      title: 'Tech News App',
      home: HomePage(),
    );
  }
}
