import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storeapp/api.dart';
import 'package:storeapp/models/ProductModel.dart';

class AllProductService {
  //____________response________________//
  Future<List<Productmodel>> getallproducts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');
    print("_____________");
    print(data);
    List<Productmodel> productlist = [];
    for (int i = 0; i < data.length; i++) {
      productlist.add(Productmodel.fromJson(data[i]));
    }
    print("after reload ___");
    print(productlist);
    return productlist;
  }
}
