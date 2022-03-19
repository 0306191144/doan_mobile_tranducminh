import 'package:flutter/material.dart';

class WidgetLable extends StatelessWidget {
  final String title;
  final String value;

  const WidgetLable({
    Key? key,
    required this.value,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(
          width: 30,
        ),
        Text(value, style: TextStyle(color: Colors.blue)),
      ]),
    );
  }
}
