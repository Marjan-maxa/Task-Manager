import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart';
import 'package:task_management/UI/controller/auth_controller.dart';

import '../../app.dart';
class ApiCaller{

  static final Logger _logger=Logger();

 static Future<ApiResponse> getRequest({required String url })
  async {
   try{
     Uri uri=Uri.parse(url);
     logRequest(url);
     Response response =await get(uri,headers: {
       'token':AuthController.accessToken??''
     });
     logReponse(url, response);
     final int statusCode=response.statusCode;
     final decodedData=jsonDecode(response.body);
     if(statusCode==200)
     {
       return ApiResponse(responseCode: statusCode, responseData: decodedData, isSuccess: true);
     }else if(statusCode==401){
       moveToLogin();
       return ApiResponse(responseCode: -1, responseData: null, isSuccess: false);
     }
     else{
       return ApiResponse(responseCode: statusCode, responseData: decodedData, isSuccess: false);
     }
   }catch(e){
     return ApiResponse(responseCode: -1, responseData: null, isSuccess: false,errorMessage:e.toString() );
   }
  }

 static Future<ApiResponse> postRequest({required String url,Map<String,dynamic>? body })
  async {
    try{
      Uri uri=Uri.parse(url);
      logRequest(url);
      Response response =await post(uri,
        body: body!=null ? jsonEncode(body): null,
        headers: {
          'Accept':'application/json',
          'Content-Type':'application/json',
          'token':AuthController.accessToken??''
        }
      );
      logReponse(url, response);
      final int statusCode=response.statusCode;
      final decodedData=jsonDecode(response.body);
      if(statusCode==200 || statusCode==201)
      {
        return ApiResponse(responseCode: statusCode, responseData: decodedData, isSuccess: true);
      }else if(statusCode==401){
        moveToLogin();
        return ApiResponse(responseCode: -1, responseData: null, isSuccess: false);
      }
      else{
        return ApiResponse(responseCode: statusCode, responseData: decodedData, isSuccess: false);
      }
    }catch(e){
      return ApiResponse(responseCode: -1, responseData: null, isSuccess: false,errorMessage: e.toString());
    }

  }

  static void logRequest(String Url, {Map<String, dynamic>? body})
  {
    _logger.i(
          'Url=> $Url\n'
          'Request body=> $body\n'
    );
  }

  static void logReponse(String Url,Response response)
  {
    _logger.i(
            'Status Code=> ${response.statusCode}\n'
            'Response body=> ${response.body}\n'
    );
  }

  static Future<void> moveToLogin()async {
   AuthController.userClearData();
   Navigator.pushNamedAndRemoveUntil(TaskManagement.navigator.currentContext!, '/Login', (predicate)=>false);
  }


 }

// reponse
// =>body
// => code


class ApiResponse{
  final int responseCode;
  final dynamic responseData;
  final bool isSuccess;
  final String? errorMessage;

  ApiResponse({required this.responseCode,required this.responseData,required this.isSuccess, this.errorMessage='Something went worng!'});
}