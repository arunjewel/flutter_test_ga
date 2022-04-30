import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:path_provider/path_provider.dart';

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
     print(imageFile!.path);
     print(showImage);

      // Directory appDocDir = await getApplicationDocumentsDirectory();
      // String appDocPath = appDocDir.path;
      // final fileName = Path.basename(imageFile.path);
      // final File localImage = await imageFile.copy('$appDocPath/$fileName');
      //
      // imageFile = File(localImage.path);
      // print(imageFile.path);
      // print(imageFile.length());
    } catch (e) {
      print(e.toString());
    }
    finally{
      notifyListeners();
    }
  }


}
