import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:news_app/controller/home_controller.dart';

// ignore: must_be_immutable
class MyBusiness extends StatelessWidget {
  MyBusiness({super.key});
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade900,
        title: const Text('News Now - Business News'),
      ),
      drawer: Drawer(),
      body: GetBuilder<HomeController>(
        builder: (controller) => ListView.separated(
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
                              .businessNewsDatas.data[index].imageUrl
                              .toString()),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    homeController.businessNewsDatas.data[index].title,
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
                                  .businessNewsDatas.data[index].author,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(homeController.businessNewsDatas.data[index].date
                          .toString())
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    textAlign: TextAlign.justify,
                    homeController.businessNewsDatas.data[index].content
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
          itemCount: homeController.businessNewsDatas.data.length,
        ),
      ),
    );
  }
}
