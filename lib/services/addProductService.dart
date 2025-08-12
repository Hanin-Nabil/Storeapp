import 'package:storeapp/api.dart';
import 'package:storeapp/models/ProductModel.dart';

class Addproductservice {
  Future<Productmodel> addproduct({
    required String title,
    required String price,
    required String image,
    required String desc,
    required String category,
  }) async {
    Map<String, dynamic> data =
        await Api().post(urL: 'https://fakestoreapi.com/products', body: {
      "title": title,
      "price": price,
      "description": desc,
      "image": image,
      "category": category,
    });
    return Productmodel.fromJson(data);
  }
}
