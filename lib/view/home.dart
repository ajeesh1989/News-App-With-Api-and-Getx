import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/controller/home_controller.dart';
import 'package:news_app/view/all.dart';
import 'package:news_app/view/business.dart';
import 'package:news_app/view/science.dart';
import 'package:news_app/view/search.dart';
import 'package:news_app/view/sports.dart';

// ignore: must_be_immutable
class MyHome extends StatefulWidget {
  MyHome({super.key});
  HomeController homeController = Get.put(HomeController());
  bool isLoading = true;
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => DefaultTabController(
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
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(() => MySearch());
                },
                icon: const Icon(Icons.search),
              )
            ],
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
          body: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TabBarView(
              children: [
                MyAllNews(),
                MySports(),
                MyBusiness(),
                MyScience(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
