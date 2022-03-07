import "package:flutter/material.dart";

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool obscureText;
  final errorText;
  TextEditingController textController;

  MyTextFormField({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    required this.prefixIcon,
    required this.textController,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusNode myFocusNode = FocusNode();
    return SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.only(top: 15),
            child: TextFormField(
                controller: textController,
                focusNode: myFocusNode,
                obscureText: obscureText,
                style: const TextStyle(fontSize: 16.0),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 20),
                    errorText: errorText != '' ? errorText : null,
                    hintText: hintText,
                    errorStyle: const TextStyle(fontSize: 14.0),
                    hintStyle: const TextStyle(fontWeight: FontWeight.normal),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                      child: Icon(
                        prefixIcon,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )))));
  }
}
