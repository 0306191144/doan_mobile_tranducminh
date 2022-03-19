import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoplaptop/Api/api.dart';
import 'package:shoplaptop/Model/carts.dart';
import 'package:shoplaptop/Model/product.dart';
import 'package:shoplaptop/Module/Cart/cart_page.dart';
import 'package:shoplaptop/provider/cart_provider.dart';
import 'package:shoplaptop/widget/alter.dart';
import 'package:shoplaptop/widget/mybutton_widget.dart';

class ProductDetaild extends StatelessWidget {
  final Product product;
  const ProductDetaild({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var products;
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      bottomNavigationBar: MyButtonWidget(
          text: 'Order',
          textStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          onPress: () async {
            var cart_new = {
              "product_id": product.id,
            };
            bool isExist = Provider.of<CartsProvider>(context, listen: false)
                .isExist(cart_new);
            if (isExist) {
              return AlertMessage.showMsg(
                  context, 'Sản phẩm này đã tồn tại trong giỏ hàng.');
            }

            var response = await Api().post('cart/add/${product.id}', cart_new);

            if (response['success'] != null && response['success']) {
              Cart myCart = Cart.fromJson(response['data']);
              context.read<CartsProvider>().add(myCart);
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return CartPage();
              }));
            } else {
              return AlertMessage.showMsg(context, response['message']);
            }
          },
          color: Colors.blueAccent,
          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0)),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                width: double.infinity,
                child: Image.network(product.img_path),
              ),
              Text(
                product.name,
                style: TextStyle(fontSize: 25.0),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                const Text('Price: ',
                    style: TextStyle(
                      fontSize: 20.0,
                    )),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  product.price.toString() + ' VND',
                  style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ]),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                child: Table(
                  border: TableBorder.all(
                      color: Colors.black, style: BorderStyle.solid, width: 2),
                  children: [
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Text('Properties', style: TextStyle(fontSize: 20.0))
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Text('Values', style: TextStyle(fontSize: 20.0))
                        ]),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [Text('Screen')]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [Text(product.screen)]),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [Text('Ram')]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [Text(product.ram)]),
                      ),
                    ]),
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [Text('Cpu')]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(children: [Text(product.cpu)]),
                      ),
                    ]),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(product.discription, style: TextStyle(fontSize: 15.0))
            ]),
          ),
        ),
      ),
    );
  }
}
