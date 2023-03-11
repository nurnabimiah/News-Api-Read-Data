import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newspaper_api/models/news_model.dart';

import '../getx/top_news_controller.dart';

class TopNewsScreens extends StatefulWidget {
  const TopNewsScreens({Key? key}) : super(key: key);

  @override
  State<TopNewsScreens> createState() => _TopNewsScreensState();
}

class _TopNewsScreensState extends State<TopNewsScreens> {
  TopNewsController homeController = Get.put(TopNewsController());
  bool _loading = false;

  @override
  void initState() {
    _getTopNews();
    super.initState();
  }

  void _getTopNews() async {
    setState(() {
      _loading = true;
    });

    await homeController.getTopNews();

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top News'),
      ),

      ///..................................
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: homeController.topNews.length,
              itemBuilder: (context, index) {
                NewsModel news = homeController.topNews[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 20,
                        child: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              news.title,
                              maxLines: 3,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Text('by mrtksn'),
                            Row(
                              children: const [
                                Icon(Icons.score),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('446'),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(Icons.comment),
                                SizedBox(
                                  width: 8,
                                ),
                                Text('446'),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
    );
  }
}
