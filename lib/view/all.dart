import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_app/controller/home_controller.dart';
import 'package:news_app/view/news_details.dart';

// ignore: must_be_immutable
class MyAllNews extends StatelessWidget {
  MyAllNews({super.key});
  HomeController homeController = Get.put(HomeController());
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    // homeController.getAnyNews("all");
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: GetBuilder<HomeController>(
        builder: (controller) => homeController.isLoading == true
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(NewsPage(
                              newsid:
                                  homeController.allNewsDatas!.data[index].id,
                            ));
                          },
                          child: Container(
                            height: 220.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(homeController
                                      .allNewsDatas!.data[index].imageUrl
                                      .toString()),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          homeController.allNewsDatas!.data[index].title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                'Author- ' +
                                    homeController
                                        .allNewsDatas!.data[index].author,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(homeController.allNewsDatas!.data[index].date
                                .toString())
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          textAlign: TextAlign.justify,
                          homeController.allNewsDatas!.data[index].content
                              .toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: homeController.allNewsDatas!.data.length,
              ),
      ),
    );
  }
}
