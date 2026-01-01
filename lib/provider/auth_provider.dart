import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:task_management/core/enums/api_state.dart';

import '../data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AuthProvider extends ChangeNotifier{
   String ? _accessToken;
   String ? _errorMassage;
   UserModel ? _userModel;
ApiState _authState=ApiState.initial;

  static String _accessTokenKey = 'token';
   static String _userModelKey = 'user-data';

  String ? get accessToken=>_accessToken;
  ApiState ? get authState=>_authState;
  UserModel ? get userModel=>_userModel;
  String ? get errorMassage=>_errorMassage;
  bool  get isLoginn=> _accessToken!=null;

   Future saveUserData(UserModel model,String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_accessTokenKey, token);
    await sharedPreferences.setString(_userModelKey, jsonEncode(model.toJson()));
    _accessToken = token;
    _userModel = model;
    notifyListeners();

  }

   Future loadUserData()async {
    SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
    String ? token = sharedPreferences.getString(_accessTokenKey);

    if(token != null){
      _accessToken=token;
      String ? userData = sharedPreferences.getString(_userModelKey);
      _userModel = UserModel.fromJson(jsonDecode(userData!)) ;
    }

 notifyListeners();

  }


   Future<void> updateUserData(UserModel model) async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    await sharedPreferences.setString(_userModelKey, jsonEncode(model.toJson()));
    notifyListeners();
  }


   Future<bool> checkLogInStatus() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    String ? token=sharedPreferences.getString(_accessTokenKey);
    return token!=null;

  }

   Future<void> logout() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
   await sharedPreferences.clear();
    _accessToken=null;
    _userModel=null;
    _authState=ApiState.initial;
    notifyListeners();
  }
 void setLoading(){
     _authState=ApiState.loading;
     notifyListeners();
 }
  void setSuccess(){
    _authState=ApiState.success;
    notifyListeners();
  }
  void setError(){
    _authState=ApiState.error;
    notifyListeners();
  }
  void resetState(){
    _authState=ApiState.initial;
    _errorMassage = null;
    notifyListeners();
  }


}