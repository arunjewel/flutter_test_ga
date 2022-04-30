import 'package:flutter/material.dart';
import 'package:flutter_test_ga/controller/login/signup_controller.dart';
import 'package:flutter_test_ga/ui/screens/login/screens/login_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../widgets/dilogbox_image_picker.dart';
import '../../../widgets/text_button_widget.dart';
import '../../../widgets/text_form_field_widget.dart';
import '../widgets/profile_picker_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupController>(builder: (_, model, __) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: ListView(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Form(
                  child: Column(children: [
                    ProfilePicturePickerWidget(
                      onButtonPress: () {
                        imagePickerShowDialog(
                          context,
                          (p0) {
                            p0 == 2
                                ? model.getProfileImage(ImageSource.gallery)
                                : model.getProfileImage(ImageSource.camera);
                            Navigator.pop(context);
                          },
                        );
                      },
                      file: model.imageFile,
                      showImage: model.showImage,
                    ),
                    TextFormFieldWidget(
                      controller: model.nameController,
                      labelText: "Name",
                    ),
                    TextFormFieldWidget(
                      controller: model.passwordController,
                      labelText: "Password",
                    ),
                    TextFormFieldWidget(
                      controller: model.confirmPasswordController,
                      labelText: "Confirm Password",
                    ),
                    TextFormFieldWidget(
                      controller: model.emailController,
                      labelText: "Email",
                      textInputType: TextInputType.emailAddress,
                    ),
                    TextFormFieldWidget(
                      controller: model.cityController,
                      labelText: "City",
                    ),
                    TextFormFieldWidget(
                      controller: model.phoneController,
                      labelText: "Phone",
                      textInputType: TextInputType.phone,
                    ),
                    TextButtonWidget(
                      onTap: () {
                        model.setSignUp().then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            ));
                      },
                      labelText: "Submit",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Row(
                      children: [
                        const Text("Existing User ?"),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: Container(
                                padding: const EdgeInsets.only(left: 10),
                                child: const Text(
                                  "Login Here",
                                  style: TextStyle(color: Colors.blue),
                                )))
                      ],
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
