import 'dart:io';

import 'package:flutter/material.dart';

class ProfilePicturePickerWidget extends StatelessWidget {
  final Function onButtonPress;
  final File? file;
  final bool showImage;

  const ProfilePicturePickerWidget(
      {Key? key,
      required this.onButtonPress,
      this.file,
      this.showImage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onButtonPress(),
      child: Stack(
        children: [
          showImage
              ? Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFe0f2f1),
                    image: DecorationImage(
                      image: FileImage(file!),
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              : Container(
            height: 200,
            width: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFe0f2f1),
                  ),

                ),
          const Positioned(
            child: Icon(
              Icons.camera_alt,
              size: 50,
            ),
            top: 150,
            right: 40,
          )
        ],
      ),
    );
  }
}
