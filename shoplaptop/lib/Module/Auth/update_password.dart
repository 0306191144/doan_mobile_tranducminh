import 'package:flutter/material.dart';
import 'package:shoplaptop/widget/mybutton_widget.dart';
import 'package:shoplaptop/widget/mytextformfield_widget.dart';

class update_password extends StatelessWidget {
  const update_password({Key? key}) : super(key: key);

  get addressshingController => null;

  get nameController => null;

  get phoneController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
