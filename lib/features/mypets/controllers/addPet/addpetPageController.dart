import 'package:flutter/material.dart';
import 'package:get/get.dart';

class addpetPageController extends GetxController {
  static addpetPageController get instance => Get.find();

  PageController pagecontroller = PageController();
  int _curIndex = 0;
  int get curIndex => _curIndex;
  bool confirmation = false;

  @override
  void onInit() {
    super.onInit();
    pagecontroller = PageController(); // Inisialisasi dengan benar
  }

  void nextPage() {
    _curIndex = _curIndex + 1;
    if (_curIndex == 5) {
      confirmation = true;
    }
    pagecontroller.animateToPage(_curIndex,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
    update();
  }

  void prevPage() {
    if (_curIndex == 0) {
      Get.back();
      update();
    } else {
      _curIndex = _curIndex - 1;
      confirmation = false;
      pagecontroller.animateToPage(_curIndex,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
      update();
    }
  }

  void reset() {
    _curIndex = 0;
    confirmation = false;
    print('reset');
    update();
  }

  @override
  void onClose() {
    print('closed');
    pagecontroller.dispose(); // Pastikan controller di-dispose
    super.onClose();
  }
}
