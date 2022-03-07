import 'package:flutter/material.dart';
import 'package:shoplaptop/Model/user.dart';
import 'package:shoplaptop/widget/footer.dart';

// ignore: camel_case_types
class Information_User extends StatefulWidget {
  const Information_User({Key? key}) : super(key: key);

  @override
  State<Information_User> createState() => _Information_UserState();
}

// ignore: camel_case_types
class _Information_UserState extends State<Information_User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: const Text('Information User '),
      ),
      bottomNavigationBar: Footer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(children: [
              Column(children: [Text('id:')]),
              Column(children: [Text('1')])
            ]),
            Row(children: [
              Column(children: [Text('name :')]),
              Column(children: [Text('tran duc minh :')])
            ]),
            Row(children: [
              Column(children: [Text('phone :')]),
              Column(children: [Text('0833832976 :')])
            ]),
            Row(children: [
              Column(children: [Text('email :')]),
              Column(children: [Text('admin@gmail.com:')])
            ]),
          ],
        ),
      ),
    );
  }
}
