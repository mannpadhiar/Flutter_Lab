import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginMiddleware extends GetMiddleware{
  @override
  RouteSettings? redirect(String? route) {
    bool isLogin = false;

    if(!isLogin){
      return RouteSettings(name: '/login');
    }
    return null;
  }
}