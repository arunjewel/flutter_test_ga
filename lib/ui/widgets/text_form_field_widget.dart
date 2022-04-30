import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType textInputType;

  const TextFormFieldWidget(
      {Key? key,
      required this.controller,
      required this.labelText,
      this.textInputType = TextInputType.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: '',
        labelText: labelText,
      ),
      keyboardType: textInputType,
      validator: (val) {},
    );
  }
}
