import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:newspaper_api/models/news_model.dart';

import '../data/network_utils.dart';

class TopNewsController extends GetxController {
  //ProductSliderModel productSliderModel = ProductSliderModel();
  bool getProgressSliderInprogress = false;

  List<int> topNewIdList = [];
  List<NewsModel> topNews = [];

  Future<bool> getTopNewsIds() async {
    getProgressSliderInprogress = true;
    update();
    final result = await NetworkUtils().getMethod(
        'https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty');

    getProgressSliderInprogress = false;
    if (result != null) {
      for (var x in result) {
        topNewIdList.add(x);
      }
      print("top news = ${topNewIdList.length}");
      //productSliderModel = ProductSliderModel.fromJson(result);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<void> getTopNews() async {
    if (topNewIdList.isEmpty) {
      await getTopNewsIds();
    }
    for (int i = 0; i < 10; i++) {
      try {
        final result = await NetworkUtils().getMethod(
            "https://hacker-news.firebaseio.com/v0/item/${topNewIdList[i]}.json?print=pretty");

        NewsModel news = NewsModel.fromJson(result);
        topNews.add(news);
        update();
      } catch (error) {
        debugPrint("error - $error");
      }
    }
  }
}
