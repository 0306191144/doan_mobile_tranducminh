import 'package:flutter/material.dart';
import 'package:shoplaptop/Model/product.dart';
import 'package:shoplaptop/Module/products/product_detail.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  ProductCard({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return ProductDetaild(
            product: product,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.grey.shade400)),
        child: Column(children: [
          SizedBox(
            child: Image.network(
              product.img_path,
              height: 120.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            product.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(product.price.toString() + ' VND',
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.red))
        ]),
      ),
    );
  }
}
