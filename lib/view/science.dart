import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_app/controller/home_controller.dart';

// ignore: must_be_immutable
class MyScience extends StatelessWidget {
  MyScience({super.key});
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // homeController.getAnyNews("science");

    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      // appBar: AppBar(
      //   elevation: 0,
      //   centerTitle: true,
      //   backgroundColor: Colors.blueGrey.shade900,
      //   title: const Text('News Now - Science News'),
      // ),
      // drawer: Drawer(),
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
                        Container(
                          height: 220.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(homeController
                                    .scienceNewsDatas!.data[index].imageUrl
                                    .toString()),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          homeController.scienceNewsDatas!.data[index].title,
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
                                        .scienceNewsDatas!.data[index].author,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(homeController
                                .scienceNewsDatas!.data[index].date
                                .toString())
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          textAlign: TextAlign.justify,
                          homeController.scienceNewsDatas!.data[index].content
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
                itemCount: homeController.scienceNewsDatas!.data.length,
              ),
      ),
    );
  }
}
