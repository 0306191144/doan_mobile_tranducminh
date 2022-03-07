import 'package:flutter/material.dart';
import 'package:shoplaptop/Module/Cart/cart_item.dart';
import 'package:shoplaptop/widget/footer.dart';

import 'package:shoplaptop/widget/mybutton_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          title: const Text('Cart'),
        ),
        bottomNavigationBar: Footer(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const CartItem(),
                  const CartItem(),
                  const CartItem(),
                  const SizedBox(
                    height: 50.0,
                  ),
                  SizedBox(
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Quantity:', style: TextStyle(fontSize: 18.0)),
                            Text('3',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold))
                          ]),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Amount:', style: TextStyle(fontSize: 18.0)),
                            Text('3000000 VND',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red))
                          ]),
                    ]),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyButtonWidget(
                      text: 'Buy',
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      onPress: () {},
                      color: Colors.blue,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10)),
                ],
              ),
            ),
          ),
        ));
  }
}
