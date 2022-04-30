import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String userName="";
  String password="";
  Future <void> getUserData()async {
    final prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('username')??"";
    password = prefs.getString('password')??"";
  }
  Future <bool> checkLogin()async{
    final prefs = await SharedPreferences.getInstance();
    if(userName==nameController.text&& passwordController.text==password){
      await prefs.setBool('loginStatus', true);
      return true;
    }
    else{
      return false;
    }
  }
}