import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:storeapp/const.dart';
import 'package:storeapp/models/ProductModel.dart';
import 'package:storeapp/services/addProductService.dart';
import 'package:storeapp/widget/CustmBotten.dart';
import 'package:storeapp/widget/CustomformField.dart';

class Addproducts extends StatefulWidget {
  const Addproducts({super.key});
  static String id = 'Addproducts';

  @override
  State<Addproducts> createState() => _AddproductsState();
}

class _AddproductsState extends State<Addproducts> {
  String? productname, desc, image, category;

  String? price;
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Addproudcts",
          style: TextStyle(color: Ksecenderycolor),
        ),
        backgroundColor: Kprimerycolor,
        elevation: 0,
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: isloading,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Customfield(
                hinttext: "Proudcts Catrgory ",
                inputType: TextInputType.number,
                onChanged: (data) {
                  category = data;
                },
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
                text: 'Add',
                ontap: () {
                  setState(() {
                    isloading = true;
                  });
                  addproducts(); //////
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addproducts() async {
    try {
      await Addproductservice().addproduct(
        title: productname!,
        price: price!,
        image: image!,
        desc: desc!,
        category: category!,
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("products add successfully!"),
      ));
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("filed to add product!"),
      ));
    } finally {
      setState(() {
        isloading = false;
      });
    }
  }
}
