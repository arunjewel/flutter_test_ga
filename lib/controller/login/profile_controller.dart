import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends ChangeNotifier{
  String userName="";
  Future <void> getUserData()async {
    final prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('username')??"";
  }
  Future <void> logOut()async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loginStatus',false);
  }
}