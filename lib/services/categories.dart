import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:storeapp/api.dart';
import 'package:storeapp/models/ProductModel.dart';

class CategoriesService {
  Future<List> getcategoriesproducts({required String CategoryName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$CategoryName');

    List<Productmodel> productlist = [];
    for (int i = 0; i < data.length; i++) {
      productlist.add(Productmodel.fromJson(data[i]));
    }
    return productlist;
  }
}
