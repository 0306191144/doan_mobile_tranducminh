import 'package:flutter/material.dart';

class widget_lable extends StatelessWidget {
  final String title;
  final String value;
  const widget_lable({Key? key, required this.value, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
        Text(value,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ))
      ]),
    );
  }
}
