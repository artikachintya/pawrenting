import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/mypets/controllers/addPet/addpetPageController.dart';
import 'package:pawrentingreborn/features/mypets/controllers/addPet/petGender.dart';
import 'package:pawrentingreborn/features/mypets/controllers/addPet/petTypeButtonCont.dart';
import 'package:pawrentingreborn/features/mypets/controllers/AddPetController.dart';
import 'package:pawrentingreborn/features/mypets/screens/petlist/petlist.dart';
import 'package:pawrentingreborn/navigationMenu.dart';
import 'package:pawrentingreborn/utils/device/device_utility.dart';

class AddPetButton extends StatelessWidget {
  const AddPetButton({
    super.key,
    required this.formGlobalKey1,
    required this.formGlobalKey2,
  });

  final formGlobalKey1;
  final formGlobalKey2;

  @override
  Widget build(BuildContext context) {
    addpetPageController pcontroller = Get.find();
    AddPetController addPetController = Get.find();
    final typeController = Get.put(PetTypeButtonController());
    final genderController = Get.put(PetGenderButtonController());
    return Positioned(
        bottom: 100,
        left: TDeviceUtil.getViewWidth(context) / 2 - 150,
        child: SizedBox(
            // color: Colors.red.withAlpha(100),
            height: 40,
            width: 300,
            child: pcontroller.confirmation
                ? Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                        onPressed: () {
                          pcontroller.prevPage();
                        },
                        child: const Text(
                          'Back',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                      )),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: ElevatedButton(
                        style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                        onPressed: () {
                          addPetController.addPet();
                          pcontroller.reset();
                          addPetController.resetController();
                          Get.to(() => PetList());
                        },
                        child: const Text(
                          'Add Pet',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                      )),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                        style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                        onPressed: () {
                          pcontroller.prevPage();
                        },
                        child: const Text(
                          'Back',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                      )),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                          child: ElevatedButton(
                        style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                        onPressed: () {
                          switch (pcontroller.curIndex) {
                            case 0:
                              {
                                if (formGlobalKey1.currentState!.validate()) {
                                  pcontroller.nextPage();
                                }
                              }
                            case 1:
                              {
                                if (typeController.dog) {
                                  pcontroller.nextPage();
                                } else if (typeController.cat) {
                                  pcontroller.nextPage();
                                }
                              }
                            case 2:
                              {
                                if (genderController.male) {
                                  pcontroller.nextPage();
                                } else if (genderController.female) {
                                  pcontroller.nextPage();
                                }
                              }
                            case 3:
                              {
                                print('anjay');
                                if (formGlobalKey2.currentState!.validate()) {
                                  pcontroller.nextPage();
                                }
                              }
                            case 4:
                              {
                                if (addPetController.base64Image == '') {
                                  Get.snackbar(
                                      "Error", "You need to upload a photo!",
                                      backgroundColor: Colors.red,
                                      colorText: Colors.white);
                                } else {
                                  pcontroller.nextPage();
                                }
                              }
                          }
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                      )),
                    ],
                  )));
  }
}
