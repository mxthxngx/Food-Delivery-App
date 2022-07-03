import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project3/utils/constants.dart';

class ApiClient extends GetConnect implements GetxService{
  late String token;
  final String appBaseUrl; // Server url
  late Map<String,String> _mainHeaders; //stores data locally, key pair value

  ApiClient({required this.appBaseUrl}){
    baseUrl = appBaseUrl;
    token = AppConstants.TOKEN;
    timeout = Duration(seconds: 30);//timeout after 30 seconds after sending the get or post request
    _mainHeaders = {
      'Content-type':'application/json; charset= UTF-8', // the header content must be json type
      'Authorization':'Bearer$token', //send token from device to server - - for post request
    };
  }
  Future<Response> getData(String uri,) async
  {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1,statusText: e.toString());
    }
  }
}