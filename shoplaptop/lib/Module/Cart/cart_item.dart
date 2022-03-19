import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shoplaptop/Api/api.dart';
import 'package:shoplaptop/Model/carts.dart';
import 'package:shoplaptop/Module/Cart/cart_page.dart';
import 'package:shoplaptop/provider/cart_provider.dart';
import 'package:shoplaptop/widget/alter.dart';

class CartItem extends StatelessWidget {
  final dynamic data;
  const CartItem({Key? key, required this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _onHandleQuantity(qty) async {
      if (qty >= 1) {
        var formData = {'quantity': qty};
        var response = await Api().post(
          'cart/update/${data.id}',
          formData,
        );

        if (response['success'] != null && response['success']) {
          Cart newCart = Cart.fromJson(response['data']);
          context.read<CartsProvider>().update(newCart);
        } else {
          AlertMessage.showMsg(context, response['message']);
        }
      }
    }

    _delete() async {
      var response = await Api().get(
        'cart/delete/${data.id}',
      );

      if (response['success'] != null && response['success']) {
        Cart newCart = Cart.fromJson(response['data']);
        context.read<CartsProvider>().delete(newCart);
      } else {
        AlertMessage.showMsg(context, response['message']);
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.all(10.0),
      child: Row(children: [
        Flexible(
            flex: 1,
            child: Image.network(data.product.img_path, fit: BoxFit.cover)),
        const SizedBox(
          width: 15.0,
        ),
        Flexible(
            flex: 2,
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text(data.product.name,
                          style: TextStyle(
                            fontSize: 18.0,
                          )),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Text('Price: '),
                          Text(
                            data.product.price.toString(),
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ],
                  )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            _delete();
                          },
                          icon: const Icon(Icons.delete_outline)),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              height: 25.0,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0)),
                                  border: Border.all(color: Colors.grey)),
                              child: Row(
                                children: [
                                  handleAmount('minus', () {
                                    _onHandleQuantity(data.quantity - 1);
                                  }),
                                  Container(
                                      alignment: Alignment.center,
                                      height: double.infinity,
                                      width: 30.0,
                                      color: Colors.grey,
                                      child: Text(
                                        data.quantity.toString(),
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  handleAmount('plus', () {
                                    _onHandleQuantity(data.quantity + 1);
                                  }),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            ])),
      ]),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black45,
      )),
    );
  }
}

IconButton handleAmount(String type, onPress) => IconButton(
    padding: EdgeInsets.zero,
    constraints: const BoxConstraints(),
    onPressed: onPress,
    icon: Icon(type == 'plus' ? Icons.add : Icons.remove));
