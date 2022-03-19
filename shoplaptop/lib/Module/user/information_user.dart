import 'package:flutter/material.dart';
import 'package:shoplaptop/Model/user.dart';
import 'package:shoplaptop/Module/user/update_information.dart';
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
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          );
        }),
        title: const Text('Information User '),
      ),
      bottomNavigationBar: Footer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetLable(
              title: 'Name:',
              value: user.name,
            ),
            WidgetLable(
              title: 'Email:',
              value: user.email,
            ),
            WidgetLable(
              title: 'Email:',
              value: user.email,
            ),
            WidgetLable(
              title: 'Birthday:',
              value: user.birthday,
            ),
            WidgetLable(
              title: 'Address:',
              value: user.address,
            ),
            MyButtonWidget(
              text: 'Change Infomation',
              padding: EdgeInsets.all(20),
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return update_User_Screen();
                }));
              },
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
