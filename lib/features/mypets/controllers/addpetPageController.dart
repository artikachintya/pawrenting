
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class addpetPageController extends GetxController{
  static addpetPageController get instance => Get.find();

  final pagecontroller = PageController();
  int _curIndex = 0;
  int get curIndex => _curIndex;
  bool confirmation = false;

  void nextPage(){
    _curIndex = _curIndex+1;
    if(_curIndex == 5){
      confirmation = true;
    }
    pagecontroller.animateToPage(_curIndex, duration: const Duration(milliseconds: 500), curve: Curves.ease);    
    update();
  }
  void prevPage(){
    if(_curIndex == 0){
      Get.back();
      update();
    }
    else{
      _curIndex = _curIndex-1;
      confirmation = false;
      pagecontroller.animateToPage(_curIndex, duration: const Duration(milliseconds: 500), curve: Curves.ease);
      update();
    }
  }
}