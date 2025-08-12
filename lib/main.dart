import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:storeapp/Screens/Addproducts.dart';
import 'package:storeapp/Screens/HomePage.dart';
import 'package:storeapp/Screens/Updataproudcts.dart';

void main() {
  runApp(MyStore());
}

class MyStore extends StatelessWidget {
  const MyStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Homepage.id: (context) => Homepage(),
        Updataproudcts.id: (context) => Updataproudcts(),
        Addproducts.id: (context) => Addproducts()
      },
      initialRoute: Homepage.id,
    );
  }
}
