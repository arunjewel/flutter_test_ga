import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/login/login_controller.dart';
import 'controller/login/profile_controller.dart';
import 'controller/login/signup_controller.dart';
import 'ui/screens/login/screens/signup_page.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  SharedPreferences.setMockInitialValues({});
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SignupController(),
          ),
          ChangeNotifierProvider(
            create: (context) => LoginController(),
          ),
          ChangeNotifierProvider(
            create: (context) => ProfileController(),
          ),

        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SignUpPage(),
        ));
  }
}
