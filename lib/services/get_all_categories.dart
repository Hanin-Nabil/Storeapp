import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:storeapp/api.dart';

class AllCategoriesService {
  Future<List> getallcategories() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
