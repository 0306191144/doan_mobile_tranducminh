import 'package:flutter/material.dart';
import 'package:shoplaptop/widget/footer.dart';
import 'package:shoplaptop/widget/mybutton_widget.dart';
import 'package:shoplaptop/widget/mytextformfield_widget.dart';

// ignore: camel_case_types
class update_User_Screen extends StatefulWidget {
  const update_User_Screen({Key? key}) : super(key: key);

  @override
  _update_User_ScreenState createState() => _update_User_ScreenState();
}

// ignore: camel_case_types
class _update_User_ScreenState extends State<update_User_Screen> {
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
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          title: const Text(' update user '),
        ),
        bottomNavigationBar: Footer(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 30),
              MyTextFormField(
                  hintText: 'Enter name',
                  prefixIcon: Icons.people,
                  textController: addressshingController),
              MyTextFormField(
                  hintText: 'Enter email',
                  prefixIcon: Icons.email,
                  textController: addressshingController),
              MyTextFormField(
                  hintText: 'Enter enter password',
                  prefixIcon: Icons.password,
                  textController: addressshingController),
              MyTextFormField(
                  hintText: 'Enter password confimation',
                  prefixIcon: Icons.password,
                  textController: nameController),
              MyTextFormField(
                  obscureText: true,
                  hintText: 'Enter name phone',
                  prefixIcon: Icons.phone,
                  textController: phoneController),
              MyTextFormField(
                  hintText: 'Enter enter address',
                  prefixIcon: Icons.personal_injury,
                  textController: addressshingController),
              MyTextFormField(
                  hintText: 'Enter enter gender',
                  prefixIcon: Icons.personal_injury,
                  textController: addressshingController),
              const SizedBox(
                height: 20.0,
              ),
              MyButtonWidget(
                  text: 'Submmit',
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  onPress: () {},
                  color: Colors.blue,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10)),
            ]),
          ),
        ));
  }
}
