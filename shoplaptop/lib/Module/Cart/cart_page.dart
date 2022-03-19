import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shoplaptop/Model/carts.dart';
import 'package:shoplaptop/Module/Cart/cart_item.dart';
import 'package:shoplaptop/Module/Invoice/infor_shipping.dart';
import 'package:shoplaptop/provider/cart_provider.dart';
import 'package:shoplaptop/widget/alert_modal.dart';
import 'package:shoplaptop/widget/footer.dart';

import 'package:shoplaptop/widget/mybutton_widget.dart';

var totail = 0.0;

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<CartsProvider>(context).getCart();

    var myCart = context.watch<CartsProvider>().getMyCart;
    var price = 0.0;
    double quantity = 0;
    for (var item in myCart) {
      price = price + item.product.price * item.quantity;
      quantity = quantity + item.quantity;
    }
    totail = price;
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
          title: const Text('Cart'),
        ),
        bottomNavigationBar: Footer(),
        body: SafeArea(
            child: SingleChildScrollView(
                child: !myCart.isEmpty
                    ? Column(
                        children: [
                          Column(
                              children: List.generate(
                                  myCart.length,
                                  (index) => CartItem(
                                        data: myCart[index],
                                      ))),
                          const SizedBox(
                            height: 50.0,
                          ),
                          SizedBox(
                            child: Column(children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Quantity:',
                                        style: TextStyle(fontSize: 18.0)),
                                    Text(quantity.toString(),
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold))
                                  ]),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Amount:',
                                        style: TextStyle(fontSize: 18.0)),
                                    Text(price.toString(),
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red))
                                  ]),
                            ]),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          MyButtonWidget(
                              text: 'Buy',
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                              onPress: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return const Inforshipping_Screen();
                                }));
                              },
                              color: Colors.yellow,
                              padding:
                                  const EdgeInsets.fromLTRB(10, 0, 10, 10)),
                        ],
                      )
                    : const AlertModal(
                        title: 'rong',
                        subtitle: 'gio hang trong',
                      ))));
  }
}
