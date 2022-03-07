import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoplaptop/Model/user.dart';
import 'package:shoplaptop/Module/user/information_user.dart';
import 'package:shoplaptop/provider/AuthProvider.dart';

// ignore: camel_case_types
class User_Screen extends StatelessWidget {
  const User_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var auth = context.watch<AuthProvider>().myValue;
    User user = auth['user'];

    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(user.name),
            accountEmail: Text(user.email),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  user.img,
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
              leading: Icon(Icons.person),
              title: Text('Information'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const Information_User();
                }));
              }),
          ListTile(
            leading: Icon(Icons.card_travel),
            title: Text('Invoices'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
