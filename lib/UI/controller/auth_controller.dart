import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../data/model/user_model.dart';
class AuthController{
  static String _accesstokenkey='token';
  static String _userModelkey='user-data';
  static String ? accessToken;
  static UserModel ? userModel;
  static Future saveUserData(UserModel model,String token) async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accesstokenkey, token);
    await sharedPreferences.setString(_userModelkey, jsonEncode(model.toJson()));
    accessToken=token;
    userModel=model;
  }

  static Future getUserData()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String ? token=sharedPreferences.getString(_accesstokenkey);

    if(token!=null){
      String? userData=sharedPreferences.getString(_userModelkey);
      userData=UserModel.fromJson(jsonDecode(userData!)) as String?;
    }
  }
}