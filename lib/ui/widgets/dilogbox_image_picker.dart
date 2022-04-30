import 'package:flutter/material.dart';

// Show Dialog function
void imagePickerShowDialog(context, final Function(int) pickerType) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return alert dialog object
      return AlertDialog(
        title: const Text('Select Profile Image'),
        content: Container(
          height: 150.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  pickerType(1);
                },
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.camera),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text('Camera'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {
                  pickerType(2);
                },
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.browse_gallery),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(' Gallery'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
