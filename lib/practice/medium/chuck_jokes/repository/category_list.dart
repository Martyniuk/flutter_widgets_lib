import 'dart:async';

import '../api/api_provider.dart';
import '../models/chuck_categories.dart';

class ChuckCategoryRepository {
  ApiProvider _provider = ApiProvider();

  Future<ChuckCategories> fetchChuckCategoryData() async {
    final response = await _provider.get("jokes/categories");
    return ChuckCategories.fromJson(response);
  }
}