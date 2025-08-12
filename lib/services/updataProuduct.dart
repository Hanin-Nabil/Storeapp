import 'package:storeapp/Screens/Updataproudcts.dart';
import 'package:storeapp/api.dart';
import 'package:storeapp/models/ProductModel.dart';

class UpdataprouductService {
  Future<Productmodel> Updataproudcts({
    required String title,
    required dynamic price,
    required int id,
    required String image,
    required String desc,
    required String category,
  }) async {
    print("product id = $id");
    Map<String, dynamic> data = await Api().put(
        urL: 'https://fakestoreapi.com/products/$id',
        body: {
          "title": title,
          "price": price,
          "description": desc,
          "image": image,
          "category": category,
        },
        token: 'token');
    return Productmodel.fromJson(data);
  }
}
