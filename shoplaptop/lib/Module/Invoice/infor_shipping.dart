import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:shoplaptop/Api/api.dart';
import 'package:shoplaptop/Model/carts.dart';
import 'package:shoplaptop/Module/Cart/cart_page.dart';
import 'package:shoplaptop/provider/cart_provider.dart';
import 'package:shoplaptop/widget/footer.dart';
import 'package:shoplaptop/widget/mybutton_widget.dart';
import 'package:shoplaptop/widget/mytextformfield_widget.dart';

// ignore: camel_case_types
class Inforshipping_Screen extends StatefulWidget {
  const Inforshipping_Screen({Key? key}) : super(key: key);

  @override
  _Inforshipping_ScreenState createState() => _Inforshipping_ScreenState();
}

// ignore: camel_case_types
class _Inforshipping_ScreenState extends State<Inforshipping_Screen> {
  TextEditingController addressController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    addressController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Footer(),
      body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Text('Enter Information shipping',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                  MyTextFormField(
                      hintText: 'Enter Address shipping',
                      prefixIcon: Icons.home,
                      textController: addressController),
                  MyTextFormField(
                      hintText: 'Enter Name Shipping',
                      prefixIcon: Icons.people,
                      textController: nameController),
                  MyTextFormField(
                      hintText: 'Enter Phone',
                      prefixIcon: Icons.phone,
                      textController: phoneController),
                  const SizedBox(
                    height: 20.0,
                  ),
                  MyButtonWidget(
                      text: 'Payment',
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                      onPress: () async {
                        var dataform = {
                          'nameship': nameController.text,
                          'adressship': addressController.text,
                          'phoneship': phoneController.text,
                          'totail': totail
                        };

                        var payment =
                            await Api().post('invoice/create', dataform);

                        if (payment["success"] == false) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('không thể thanh toan')));
                        } else {
                          context.read<CartsProvider>().remove();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return const CartPage();
                          }));
                        }
                      },
                      color: Colors.yellow,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10)),
                ],
              ))),
    );
  }
}
