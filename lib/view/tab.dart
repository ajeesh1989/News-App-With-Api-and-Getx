import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/view/all.dart';
import 'package:news_app/view/business.dart';
import 'package:news_app/view/science.dart';
import 'package:news_app/view/sports.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  List<String> tabs = [
    "All",
    "Sports",
    "Business",
    "Science",
  ];
  int current = 0;

  double changePositionedOfLine() {
    switch (current) {
      case 0:
        return 0;
      case 1:
        return 45;
      case 2:
        return 105;
      case 3:
        return 180;
      default:
        return 0;
    }
  }

  double changeContainerWidth() {
    switch (current) {
      case 0:
        return 20;
      case 1:
        return 40;
      case 2:
        return 62;
      case 3:
        return 57;
      default:
        return 0;
    }
  }

  List myList = [
    MyAllNews(),
    MySports(),
    MyBusiness(),
    MyScience(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade900,
        title: Text(
          "News Now",
          style: GoogleFonts.ubuntu(fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
      drawer: const Drawer(),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15),
              width: size.width,
              height: size.height * 0.05,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: SizedBox(
                      width: size.width,
                      height: size.height * 0.04,
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: tabs.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: index == 0 ? 10 : 23, top: 7),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                  });
                                },
                                child: Text(
                                  tabs[index],
                                  style: GoogleFonts.ubuntu(
                                    fontSize: current == index ? 16 : 14,
                                    fontWeight: current == index
                                        ? FontWeight.w400
                                        : FontWeight.w300,
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  AnimatedPositioned(
                    curve: Curves.fastLinearToSlowEaseIn,
                    bottom: 0,
                    left: changePositionedOfLine(),
                    duration: const Duration(milliseconds: 500),
                    child: AnimatedContainer(
                      margin: const EdgeInsets.only(left: 10),
                      width: changeContainerWidth(),
                      height: size.height * 0.008,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade400,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.fastLinearToSlowEaseIn,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.3),
              child: Text(
                "${tabs[current]} Tab Content",
                style: GoogleFonts.ubuntu(fontSize: 30),
              ),
            )
          ],
        ),
      ),
    );
  }
}
