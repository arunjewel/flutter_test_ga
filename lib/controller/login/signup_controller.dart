import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupController extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  final ImagePicker picker = ImagePicker();
 bool showImage = false;
  File? imageFile;

 Future<void> getProfileImage(final ImageSource imageSource) async {
    try {
      imageFile?.delete();
      final XFile? image = await picker.pickImage(
        source: imageSource,
        imageQuality: 100,
      );
     imageFile = File(image!.path);
     showImage=true;
    } catch (e) {
      print(e.toString());
    }
    finally{
      notifyListeners();
    }
  }

  Future <void> setSignUp()async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', nameController.text);
    await prefs.setString('password', passwordController.text);
    await prefs.setBool('loginStatus', true);
  }


}
