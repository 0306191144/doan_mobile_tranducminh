import 'package:flutter/material.dart';
import 'package:shoplaptop/provider/ProductProvider.dart';
import 'package:provider/src/provider.dart';

class CenterPageLarge extends StatefulWidget {
  const CenterPageLarge({Key? key}) : super(key: key);
  @override
  State<CenterPageLarge> createState() => CenterPageLargeState();
}

class CenterPageLargeState extends State<CenterPageLarge> {
  Widget build(BuildContext context) {
    Provider.of<ProductsProvider>(context).getProducts();
    var products = context.watch<ProductsProvider>().myValue;
    return Center(
      child: CarouselSlider(
          options: CarouselOptions(
            height: 130,
            autoPlay: true,
            enlargeCenterPage: true,
          ),
          items: [
            MyImageView(products[0].imgPath),
            MyImageView(products[1].imgPath),
            MyImageView(products[2].imgPath),
          ]),
    );
  }

  CarouselOptions(
      {required int height,
      required bool autoPlay,
      required bool enlargeCenterPage}) {}

  CarouselSlider({options, required List<MyImageView> items}) {}
}

class MyImageView extends StatelessWidget {
  String imgPath;
  MyImageView(this.imgPath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Image.network(imgPath),
        ));
  }
}
