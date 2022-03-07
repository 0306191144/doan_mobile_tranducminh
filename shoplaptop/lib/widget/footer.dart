import 'package:flutter/material.dart';
import 'package:shoplaptop/Module/Cart/cart_page.dart';
import 'package:shoplaptop/Module/home/components/body.dart';
import 'package:shoplaptop/Module/home/home.dart';
import 'package:shoplaptop/Module/user/user.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return Home_Page();
              }));
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return CartPage();
              }));
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return User_Screen();
              }));
            },
          ),
        ],
      ),
    );
  }
}
