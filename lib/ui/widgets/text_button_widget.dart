import 'package:flutter/material.dart';

import '../../core/constants.dart';
class TextButtonWidget extends StatelessWidget {
  final Function onTap;
  final String labelText;

  const TextButtonWidget(
      {Key? key, required this.onTap, required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width ,
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kMainThemeColor),
              padding: MaterialStateProperty.all(const EdgeInsets.all(10))),
          onPressed: () => onTap,
          child: Text(
            labelText,
            style: const TextStyle(color: kSubThemeColor),
          )),
    );
  }
}
