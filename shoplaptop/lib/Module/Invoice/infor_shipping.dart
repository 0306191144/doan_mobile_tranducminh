import 'package:flutter/material.dart';
import 'package:shoplaptop/widget/footer.dart';
import 'package:shoplaptop/widget/mytextformfield_widget.dart';

// ignore: camel_case_types
class Inforshipping_Screen extends StatefulWidget {
  const Inforshipping_Screen({Key? key}) : super(key: key);

  @override
  _Inforshipping_ScreenState createState() => _Inforshipping_ScreenState();
}

// ignore: camel_case_types
class _Inforshipping_ScreenState extends State<Inforshipping_Screen> {
  TextEditingController addressshingController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    addressshingController.dispose();
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 50),
              const Text('Enter Information shipping',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
              MyTextFormField(
                  hintText: 'Enter Address shipping',
                  prefixIcon: Icons.home,
                  textController: addressshingController),
              MyTextFormField(
                  hintText: 'Enter Name Shipping',
                  prefixIcon: Icons.people,
                  textController: nameController),
              MyTextFormField(
                  obscureText: true,
                  hintText: 'Enter Phone',
                  prefixIcon: Icons.phone,
                  textController: phoneController),
              const SizedBox(
                height: 20.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (_) {
                    // }));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (_) {
                    // }));
                  },
                )
              ])
            ]),
          ),
        ));
  }
}
