import 'package:cat_facts_flutter/core/models/cat_fact_model.dart';
import 'package:cat_facts_flutter/core/services/cats_service.dart';
import 'package:get/get.dart';

class CatsController extends GetxController {
  var catdList = <CatFact>[].obs;
  var isLoading = true.obs;
  final CatsService _feedService = CatsService();

  Future<void> getFeedList() async {
    try {
      isLoading(true);
      var fetchFeed = await _feedService.getCatsList();

      catdList.assignAll(fetchFeed);
    } finally {
      isLoading(false);
    }
  }
}
