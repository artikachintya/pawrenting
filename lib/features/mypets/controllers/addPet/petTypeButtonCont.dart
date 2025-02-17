import 'package:get/get_state_manager/get_state_manager.dart';

class PetTypeButtonController extends GetxController{
  bool dog = false;
  bool cat = false;

  void selectDog(){
    dog = true;
    cat = false;
    update();
  }
  void selectCat(){
    dog = false;
    cat = true;
    update();
  }
}