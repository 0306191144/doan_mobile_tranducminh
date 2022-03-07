import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoplaptop/Api/api.dart';
import 'package:shoplaptop/Model/user.dart';
import 'package:shoplaptop/Module/Auth/register.dart';
import 'package:shoplaptop/Module/home/components/body.dart';
import 'package:shoplaptop/Module/home/home.dart';
import 'package:shoplaptop/provider/AuthProvider.dart';

import 'package:shoplaptop/widget/mybutton_widget.dart';
import 'package:shoplaptop/widget/mytextformfield_widget.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  String error = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('Login',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(error,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.red)),
        ),
        MyTextFormField(
            hintText: 'Nhập Email',
            prefixIcon: Icons.email,
            textController: emailController),
        MyTextFormField(
            obscureText: true,
            hintText: 'Nhập Password',
            prefixIcon: Icons.password,
            textController: passwordController),
        const SizedBox(
          height: 20.0,
        ),
        MyButtonWidget(
            text: 'Đăng nhập',
            textStyle: const TextStyle(fontSize: 16.0, color: Colors.white),
            onPress: () async {
              var formData = {
                "email": emailController.text,
                "password": passwordController.text
              };
              var data = await Api().post('login', formData);
              if (data["success"] == true) {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString("token", data["data"]['token']);
                User user = User.fromJson(data['data']['user']);
                context
                    .read<AuthProvider>()
                    .update({'user': user, 'token': data["data"]['token']});
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return Home_Page();
                }));
              } else {
                setState(() {
                  error = data['message'];
                });
              }
            },
            color: Colors.yellow,
            padding: EdgeInsets.zero),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bạn chưa có tài khoản? '),
            TextButton(
              child: const Text('Đăng ký'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return RegisterScreen();
                }));
              },
            )
          ],
        )
      ]),
    ));
  }
}
