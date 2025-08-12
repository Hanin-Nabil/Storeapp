import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/Screens/Addproducts.dart';
import 'package:storeapp/Screens/Updataproudcts.dart';
import 'package:storeapp/const.dart';
import 'package:storeapp/models/ProductModel.dart';

class CustomCart extends StatefulWidget {
  CustomCart({required this.product, super.key});
  Productmodel product;

  @override
  State<CustomCart> createState() => _CustomCartState();
}

class _CustomCartState extends State<CustomCart> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 40,
                color: Colors.grey.withValues(alpha: 0.2),
                spreadRadius: 0,
                offset: Offset(10, 10)),
          ]),
          child: GestureDetector(
            //++++++++++++++++++++++++++++=//
            onLongPress: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.warning,
                animType: AnimType.rightSlide,
                title: 'Warring',
                desc: 'Choose what do you want... .',
                btnCancelOnPress: () async {
                  await Navigator.pushNamed(
                    context,
                    Addproducts.id,
                  );
                },
                btnCancelText: "Add",
                btnOkText: "Edit",
                btnOkOnPress: () async {
                  Navigator.pushNamed(context, Updataproudcts.id,
                      arguments: widget.product);
                },
              ).show();

              setState(() {});
              //______________________________________________//
            },

            //++++++++++++++++++++++++++++++++++++//

            child: Card(
              color: Colors.white,
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.title.substring(0, 10),
                      style: TextStyle(color: kthirdcolor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$' '${widget.product.price.toString()}',
                          style: TextStyle(color: Ksecenderycolor),
                        ),
                        Icon(Icons.favorite, color: Colors.red),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 10,
          left: 20,
          bottom: 80,
          child: Image.network(
            widget.product.image,
            height: 96.0,
            width: 96.0,
            // fit: BoxFit.cover
          ),
        ),
      ],
    );
  }
}
