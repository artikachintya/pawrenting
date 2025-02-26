import 'package:get/get_state_manager/get_state_manager.dart';

class PetGenderButtonController extends GetxController{
  bool male = false;
  bool female = false;

  void selectmale(){
    male = true;
    female = false;
    update();
  }
  void selectfemale(){
    male = false;
    female = true;
    update();
  }
}