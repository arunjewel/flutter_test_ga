import 'package:flutter/material.dart';
import 'package:flutter_test_ga/controller/login/profile_controller.dart';
import 'package:provider/provider.dart';

import '../../../widgets/text_button_widget.dart';
import '../../login/screens/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ProfileController>().getUserData();
    return Consumer<ProfileController>(builder: (_, model, __) {
      return Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome  " + model.userName),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                TextButtonWidget(
                  onTap: () {
                    model.logOut().then((value) => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        ));
                  },
                  labelText: "Log out",
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
