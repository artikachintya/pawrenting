import 'package:flutter/material.dart';

class TDeviceUtil{
  static double getAppBarHeight(){
    return kToolbarHeight;
  }

  static double getViewWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
}
