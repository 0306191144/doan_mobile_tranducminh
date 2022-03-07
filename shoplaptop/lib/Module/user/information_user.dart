import 'package:flutter/material.dart';
import 'package:shoplaptop/Model/user.dart';
import 'package:shoplaptop/widget/footer.dart';
import 'package:provider/provider.dart';
import 'package:shoplaptop/provider/AuthProvider.dart';
import 'package:shoplaptop/widget/information_wiget.dart';
import 'package:shoplaptop/widget/mybutton_widget.dart';

// ignore: camel_case_types
class Information_User extends StatefulWidget {
  const Information_User({Key? key}) : super(key: key);
  @override
  State<Information_User> createState() => _Information_UserState();
}

class _Information_UserState extends State<Information_User> {
  @override
  Widget build(BuildContext context) {
    var auth = context.watch<AuthProvider>().myValue;
    User user = auth['user'];
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: const Text('Information User '),
      ),
      bottomNavigationBar: Footer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(children: [
              widget_lable(
                value: user.id.toString(),
                title: 'id',
              )
            ]),
            Row(children: [
              widget_lable(
                value: user.id.toString(),
                title: 'id',
              )
            ]),
            Row(children: [
              widget_lable(
                value: user.id.toString(),
                title: 'id',
              )
            ]),
            Row(children: [
              widget_lable(
                value: user.id.toString(),
                title: 'id',
              )
            ]),
            Row(children: [
              widget_lable(
                value: user.name,
                title: 'name',
              )
            ]),
            Row(children: [
              widget_lable(
                value: user.birthday,
                title: 'birthday',
              )
            ]),
            Row(children: [
              widget_lable(
                value: user.address,
                title: 'address',
              )
            ]),
            Row(children: [
              widget_lable(
                value: user.phone,
                title: 'phone',
              )
            ]),
            Row(children: [
              MyButtonWidget(
                  text: 'change Information',
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  onPress: () {},
                  color: Colors.blue,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10)),
            ])
          ],
        ),
      ),
    );
  }
}
