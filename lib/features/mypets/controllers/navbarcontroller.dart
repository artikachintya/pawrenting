import 'package:get/get.dart';

class NavBarController extends GetxController{
  int _curIndex = 0;
  int get curIndex => _curIndex;

  void setCurIndex(int index){
    _curIndex = index;
  }
}