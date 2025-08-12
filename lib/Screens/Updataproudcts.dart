// ignore_for_file: duplicate_import

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/const.dart';
import 'package:storeapp/models/ProductModel.dart';
import 'package:storeapp/services/updataProuduct.dart';
import 'package:storeapp/widget/CustmBotten.dart';
import 'package:storeapp/widget/CustomformField.dart';

import '../services/updataProuduct.dart';

class Updataproudcts extends StatefulWidget {
  const Updataproudcts({super.key});
  static String id = 'Updataproudcts';

  @override
  State<Updataproudcts> createState() => _UpdataproudctsState();
}

class _UpdataproudctsState extends State<Updataproudcts> {
  String? productname, desc, image;

  String? price;

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    Productmodel product =
        ModalRoute.of(context)!.settings.arguments as Productmodel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Updataproudcts",
            style: TextStyle(color: Ksecenderycolor),
          ),
          backgroundColor: Kprimerycolor,
          elevation: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Customfield(
                hinttext: "Proudcts Name ",
                onChanged: (data) {
                  productname = data;
                },
              ),
              Customfield(
                hinttext: "Products Price ",
                inputType: TextInputType.number,
                onChanged: (data) {
                  price = data;
                },
              ),
              Customfield(
                hinttext: "Products Image ",
                onChanged: (data) {
                  image = data;
                },
              ),
              Customfield(
                hinttext: "Products Description ",
                onChanged: (data) {
                  desc = data;
                },
              ),
              Custmbotten(
                text: 'Updata',
                ontap: () async {
                  islooding:
                  true;
                  setState(() {});
                  try {
                    await updataproduct(product);
                    print("_________________success___________________");
                    setState(() {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Product updated successfully!')));
                      // هنا يمكنك تحديث البيانات أو إضافة إشعار للمستخدم
                    });

                    // إظهار إشعار للمستخدم إذا أردت (اختياري)
                  } on Exception catch (e) {
                    print(e.toString());
                  }
                  islooding:
                  false;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updataproduct(Productmodel product) async {
    await UpdataprouductService().Updataproudcts(
        id: product.id,
        title: productname == null ? product.title : productname!,
        price: price == null
            ? product.price.toString()
            : price!, //______________________//
        image: image == null ? product.image : image!,
        desc: desc == null ? product.description : desc!,
        category: product.category);
    Navigator.pop(context); // العودة إلى الصفحة السابقة بعد التحديث.
  }
}
