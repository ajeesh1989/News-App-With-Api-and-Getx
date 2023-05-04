import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/view/all.dart';
import 'package:news_app/view/business.dart';
import 'package:news_app/view/science.dart';
import 'package:news_app/view/sports.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade900,
          centerTitle: true,
          title: Text(
            "News Now",
            style:
                GoogleFonts.ubuntu(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Sports',
              ),
              Tab(
                text: 'Business',
              ),
              Tab(
                text: 'Science',
              ),
            ],
          ),
        ),
        drawer: const Drawer(),
        body: TabBarView(
          children: [
            MyAllNews(),
            MySports(),
            MyBusiness(),
            MyScience(),
          ],
        ),
      ),
    );
  }
}
