import 'dart:async';
import 'package:get/get.dart';

class NonReactiveController extends GetxController{
  var count = 0.obs;
  var stringChange = ''.obs;
  var time = DateTime.now().obs;
  var isVisible = false.obs;


  void increment(){
    count++;
  }

  void changeText(String value){
    stringChange.value = value;
  }

  void setTimer(){
    Timer.periodic(Duration(seconds: 15), (timer) => time.value = DateTime.now(),);
  }

  void changeBool(){
    isVisible.value = !isVisible.value;
  }
}