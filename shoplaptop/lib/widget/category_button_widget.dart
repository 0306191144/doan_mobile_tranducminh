import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoplaptop/Model/producttype.dart';

class Category_Button extends StatelessWidget {
  ProductType producttype;
  Category_Button({Key? key, required this.producttype}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50,
                backgroundImage: NetworkImage(producttype.image)),
          ),
          const SizedBox(height: 20.0),
          Text(producttype.name),
        ],
      ),
    );
  }
}
