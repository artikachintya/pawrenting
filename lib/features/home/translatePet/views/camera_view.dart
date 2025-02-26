import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/home/translatePet/controller/scan_controller.dart';

class CameraView extends StatelessWidget {
  CameraView({super.key});

  final ScannerController controller = Get.put(ScannerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (!controller.isCameraInitialized.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return Stack(
          children: [
            CameraPreview(controller.cameraController),
            Positioned(
              top: 20,
              left: 20,
              child: IconButton(
                icon: const Icon(Icons.switch_camera, color: Colors.white),
                onPressed: controller.switchCamera,
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.flash_on, color: Colors.white),
                onPressed: controller.togglePetMode,
              ),
            ),
          ],
        );
      }),
    );
  }
}
