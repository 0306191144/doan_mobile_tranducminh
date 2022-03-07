// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoplaptop/Module/home/components/body.dart';
import 'package:shoplaptop/Module/user/user.dart';
import 'package:shoplaptop/provider/ProductProvider.dart';
import 'package:shoplaptop/widget/footer.dart';

Icon customIcon = const Icon(Icons.search);
Widget customSearchBar = const Text('Seach Name Product');

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const User_Screen(),
      appBar: AppBar(
        title: customSearchBar,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.clear);
                  customSearchBar = const ListTile(
                    leading: Icon(
                      Icons.search,
                      size: 25,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: 'Name Product',
                        hintStyle: TextStyle(
                          color: Colors.black45,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(color: Colors.black26),
                    ),
                  );
                } else {
                  customSearchBar = const Text('Seach');
                  customIcon = const Icon(Icons.search);
                }
              });
            },
            icon: customIcon,
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      body: Home_body(),
      bottomNavigationBar: Footer(),
    );
  }
}
