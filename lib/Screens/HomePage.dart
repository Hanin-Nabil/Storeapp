import 'package:flutter/material.dart';
import 'package:storeapp/const.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/models/ProductModel.dart';
import 'package:storeapp/services/get_all_product.dart';
import 'package:storeapp/widget/Custom_Cart.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  static String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.cartPlus, color: Ksecenderycolor),
            ),
          ],
          centerTitle: true,
          elevation: 0,
          title: Text(
            "New Trend",
            style: TextStyle(color: Ksecenderycolor),
          ),
          backgroundColor: Kprimerycolor,
        ),
        body: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 70),
            child: FutureBuilder<List<Productmodel>>(
                future: AllProductService().getallproducts(),
                builder: (context, snapshot) {
                  print("📌 حالة FutureBuilder: ${snapshot.connectionState}");

                  if (snapshot.hasError) {
                    print("❌ حدث خطأ: ${snapshot.error}");
                    return Center(
                        child: Text(" :( حدث خطأ: ${snapshot.error}"));
                  }

                  if (snapshot.hasData) {
                    List<Productmodel> products = snapshot.data!;
                    print("✅ عدد المنتجات المسترجعة: ${products.length}");

                    if (products.isEmpty) {
                      return Center(
                          child: Text("⚠️ لم يتم العثور على منتجات!"));
                    }

                    return GridView.builder(
                      itemCount: products.length,
                      clipBehavior: Clip.none,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 60,
                      ),
                      itemBuilder: (context, index) {
                        return CustomCart(product: products[index]);
                        // 🔴 بدلًا من CustomCart جرب هذا
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }
                //+++++++++++++++++++++++++++++++++++++++++++++//

                )));
  }
}
