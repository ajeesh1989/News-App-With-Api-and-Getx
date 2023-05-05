import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/home_controller.dart';

import 'news_details.dart';

class MySearch extends StatelessWidget {
  MySearch({super.key});
  double width = Get.width;
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade900,
        title: const Text('Search News'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<HomeController>(
            builder: (controller) => ListView(
              children: [
                CupertinoSearchTextField(
                  controller: homeController.searchEditingController,
                  backgroundColor: Colors.white12,
                  autofocus: true,
                  onChanged: (value) {
                    homeController.search(
                        homeController.searchEditingController.text.trim());
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                NewsPage(
                                  newsid: homeController.searchList[index].id,
                                ),
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100.0,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(homeController
                                            .searchList[index].imageUrl
                                            .toString()),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: width * 0.59,
                                  child: Text(
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    homeController.searchList[index].title,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),

                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Author- ${homeController.searchList[index].author}',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              Text(homeController.searchList[index].date
                                  .toString())
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          // Text(
                          //   textAlign: TextAlign.justify,
                          //   homeController.searchList[index].content.toString(),
                          //   style: const TextStyle(
                          //     fontWeight: FontWeight.w400,
                          //     fontSize: 16.0,
                          //   ),
                          // )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: homeController.searchList.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
