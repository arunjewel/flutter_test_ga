import 'package:flutter/material.dart';
import 'package:flutter_test_ga/controller/login/login_controller.dart';
import 'package:provider/provider.dart';

import '../../../widgets/text_button_widget.dart';
import '../../../widgets/text_form_field_widget.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginController>(
      builder: (_,model,__) {
        return Scaffold(
          body: SafeArea(child: Container(
            margin: const EdgeInsets.all(20),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const Text(
                  "Login",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Form(child:  Column(children: [
                  TextFormFieldWidget(
                    controller: model.nameController,
                    labelText: "Name",
                  ),
                  TextFormFieldWidget(
                    controller: model.nameController,
                    labelText: "Password",
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  TextButtonWidget(
                    onTap: () {},
                    labelText: "Login",
                  ),
                ],),),
              ],
            ),
          ),),
        );
      }
    );
  }
}
