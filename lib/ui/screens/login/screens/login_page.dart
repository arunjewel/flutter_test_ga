import 'package:flutter/material.dart';
import 'package:flutter_test_ga/controller/login/login_controller.dart';
import 'package:flutter_test_ga/ui/screens/login/screens/signup_page.dart';
import 'package:flutter_test_ga/ui/screens/main_page/screens/main_page.dart';
import 'package:provider/provider.dart';

import '../../../widgets/text_button_widget.dart';
import '../../../widgets/text_form_field_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<LoginController>().getUserData();
    return Consumer<LoginController>(builder: (_, model, __) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Form(
                  child: Column(
                    children: [
                      TextFormFieldWidget(
                        controller: model.nameController,
                        labelText: "Name",
                      ),
                      TextFormFieldWidget(
                        controller: model.passwordController,
                        labelText: "Password",
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      TextButtonWidget(
                        onTap: () {
                          model.checkLogin().then((value) => value
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainPage()),
                                )
                              : showDialog(
                                  context: context,
                                  builder: (_) => const AlertDialog(
                                        title: Text('Something went wrong'),
                                        content: Text('Invalid Username or password'),
                                      )));
                        },
                        labelText: "Login",
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Row(
                        children: [
                          const Text("New User ?"),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()),
                                );
                              },
                              child: Container(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: const Text(
                                    "Register Here",
                                    style: TextStyle(color: Colors.blue),
                                  )))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
