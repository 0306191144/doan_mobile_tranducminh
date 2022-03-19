import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoplaptop/Model/product.dart';
import 'package:shoplaptop/Module/Auth/Login.dart';
import 'package:shoplaptop/Module/Cart/cart_page.dart';
import 'package:shoplaptop/Module/home/Home.dart';
import 'package:shoplaptop/Module/home/components/body.dart';
import 'package:shoplaptop/Module/products/product_caterory.dart';
import 'package:shoplaptop/Module/user/update_information.dart';
import 'package:shoplaptop/provider/AuthProvider.dart';
import 'package:shoplaptop/provider/product_provider.dart';
import 'package:shoplaptop/provider/cart_provider.dart';
import 'Module/Invoice/infor_shipping.dart';
import 'Module/Invoice/invoice_item.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => ProductsProvider()),
      ChangeNotifierProvider(create: (_) => CartsProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: loginScreen());
  }
}
