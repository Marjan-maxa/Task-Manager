import 'package:flutter/cupertino.dart';
import 'package:task_management/core/enums/api_state.dart';
import 'package:task_management/data/model/user_model.dart';
import 'package:task_management/data/services/api_caller.dart';

import '../data/Utils/urls.dart';

class NetworkProvider extends ChangeNotifier{
  ApiState _loginState=ApiState.initial;
  ApiState _registrationState=ApiState.initial;
  ApiState _profileUpdateState=ApiState.initial;

  String ? _errorMassage;

  ApiState get  loginState=>_loginState;
  ApiState get  registrationState=>_registrationState;
  ApiState get profileUpdateState=>_profileUpdateState;



  String ? get errorMassage=>_errorMassage;

  Future<Map<String,dynamic>?> login({
    required String email,
    required String passward
  })async{

  Map<String,dynamic>requestBody={
    "email":email,
    "password":passward
  };
   final ApiResponse response=await ApiCaller.postRequest
     (url: Urls.loginUrl,
       body: requestBody);

  if(response.isSuccess){
    _loginState=ApiState.success;
    notifyListeners();

    return {
      "user":UserModel.fromJson(response.responseData['data']),
      "token":response.responseData['token']
    };
  }else{
    _loginState=ApiState.error;
    _errorMassage=response.errorMessage?? "login failed!";
    notifyListeners();
    return null;
  }

  }


  Future<Map<String,dynamic>?> register({
    required String email,
    required String firstName,
    required String lastName,
    required String mobile,
    required String passward})async{

    Map<String,dynamic>requestbody={
      "email":email,
      "fistName":firstName,
      "lastName":lastName,
      "mobile":mobile,
      "password":passward

    };
    ApiResponse response=await ApiCaller.postRequest(url: Urls.registrationUrl,body: requestbody);

    if(response.isSuccess){
      _registrationState=ApiState.success;
      notifyListeners();

      return response.responseData;
    }else{
      _registrationState=ApiState.error;
      _errorMassage=response.errorMessage?? "registration failed!";
      notifyListeners();
      return null;
    }
    //"email":email,
    //       "fastName":firstName,
    //       "lastName":lastName,
    //       "mobile":mobile,
    //       "passaward":passward

  }

}