import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shoplaptop/Model/product.dart';
import 'package:shoplaptop/provider/ProductProvider.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ProductsProvider>(context).getProducts();

    var products = context.watch<ProductsProvider>().myValue;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.all(10.0),
      child: Row(children: [
        Flexible(flex: 1, child: Image.network(products[0].imgPath)),
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
                      Text(products[0].name),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Text('Price: '),
                          Text(
                            products[0].price.toString(),
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
                          onPressed: () {},
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
                                  handleAmount('minus', () {}),
                                  Container(
                                      alignment: Alignment.center,
                                      height: double.infinity,
                                      width: 30.0,
                                      color: Colors.grey,
                                      child: const Text(
                                        '1',
                                        style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  handleAmount('plus', () {}),
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
