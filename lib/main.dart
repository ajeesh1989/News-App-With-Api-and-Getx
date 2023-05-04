import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/all.dart';
import 'package:news_app/view/business.dart';
import 'package:news_app/view/home.dart';
import 'package:news_app/view/science.dart';
import 'package:news_app/view/sports.dart';
import 'package:news_app/view/news_details.dart';
import 'package:news_app/view/tab.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
      theme: ThemeData.dark(),
    );
  }
}
