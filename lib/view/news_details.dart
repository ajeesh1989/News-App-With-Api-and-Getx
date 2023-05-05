import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/home_controller.dart';

class NewsPage extends StatelessWidget {
  final String newsid;
  final homeC = Get.put(HomeController());

  NewsPage({super.key, required this.newsid});

  @override
  Widget build(BuildContext context) {
    final findnews = homeC.findById(newsid);
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        centerTitle: true,
        title: Text(findnews.date.toString()),
        elevation: 0,
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                findnews.title.toString(),
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Reporter - ${findnews.author}',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 350.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(findnews.imageUrl),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                textAlign: TextAlign.justify,
                findnews.content.toString(),
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
