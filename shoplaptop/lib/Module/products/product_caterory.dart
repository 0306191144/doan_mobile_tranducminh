import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:shoplaptop/Api/api.dart';

import 'package:shoplaptop/Model/product.dart';
import 'package:shoplaptop/provider/product_provider.dart';
import 'package:shoplaptop/widget/footer.dart';
import 'package:shoplaptop/widget/mybutton_widget.dart';
import 'package:shoplaptop/widget/product_card_widget.dart';

// ignore: camel_case_types
class Product_category extends StatefulWidget {
  const Product_category({Key? key}) : super(key: key);
  @override
  _Product_categoryState createState() => _Product_categoryState();
}

// ignore: camel_case_types
class _Product_categoryState extends State<Product_category> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ProductsProvider>(context).getProducts();
    var products = context.watch<ProductsProvider>().myValue;

    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          title: const Text('Category Dell'),
        ),
        bottomNavigationBar: Footer(),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            !products.isEmpty
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: products?.length ?? 0,
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
                : Text('')
          ]),
        ));
  }
}
