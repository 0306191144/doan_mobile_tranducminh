import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shoplaptop/Model/product.dart';
import 'package:shoplaptop/Model/producttype.dart';
import 'package:shoplaptop/Module/home/components/sline.dart';
import 'package:shoplaptop/Module/user/user.dart';
import 'package:shoplaptop/provider/product_provider.dart';
import 'package:shoplaptop/widget/category_button_widget.dart';
import 'package:shoplaptop/widget/product_card_widget.dart';

// ignore: camel_case_types
class Home_body extends StatefulWidget {
  const Home_body({Key? key}) : super(key: key);
  @override
  Home_bodyState createState() => new Home_bodyState();
}

// ignore: camel_case_types
class Home_bodyState extends State<Home_body> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProductsProvider>(context).getProducts();
    Provider.of<ProductsProvider>(context).getProducts_new();

    var products = context.watch<ProductsProvider>().myValue;
    var products_new = context.watch<ProductsProvider>().mynew;

    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(children: [
        const SizedBox(height: 30),
        const Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Text('Category',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                )),
          ),
        ),
        GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 4.0,
            shrinkWrap: true,
            children: List.generate(category.length, (index) {
              return Category_Button(
                producttype: category[index],
              );
            })),
        const Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Text('New Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                )),
          ),
        ),
        !products_new.isEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products_new.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.5,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0),
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(product: products_new[index]);
                    }),
              )
            : Text(''),
        const Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Text('Products',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                )),
          ),
        ),
        !products.isEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: products.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.5,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0),
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(product: products[index]);
                    }),
              )
            : Text(''),
      ]),
    );
  }
}
