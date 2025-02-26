import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

class ScannerController extends GetxController {
  late CameraController cameraController;
  late List<CameraDescription> cameras;
  var interpreterPet = Rxn<tfl.Interpreter>();
  var interpreterEmotion = Rxn<tfl.Interpreter>();
  var isInterpreterInitialized = false.obs;
  var isCameraInitialized = false.obs;
  var selectedCameraIndex = 0;
  var isDogMode = true.obs;
  var _isStreaming = false; // Untuk mencegah double startImageStream
  var _isProcessing = false; // Untuk mencegah multiple processing

  @override
  void onInit() async {
    super.onInit();
    await initTFLite();
    await initCamera();
  }

  @override
  void dispose() {
    stopCameraStream();
    cameraController.dispose();
    interpreterPet.value?.close();
    interpreterEmotion.value?.close();
    super.dispose();
  }

  Future<void> initCamera() async {
    if (await Permission.camera.request().isGranted) {
      cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        await startCamera(selectedCameraIndex);
      }
    }
  }

  Future<void> startCamera(int cameraIndex) async {
    await stopCameraStream(); // Pastikan stream sebelumnya dihentikan
    if (isCameraInitialized.value) {
      await cameraController.dispose();
    }

    cameraController =
        CameraController(cameras[cameraIndex], ResolutionPreset.low);

    try {
      await cameraController.initialize();
      isCameraInitialized(true);
      _isStreaming = true;
      cameraController.startImageStream(processImage);
    } catch (e) {
      print("Error initializing camera: $e");
    }
  }

  Future<void> stopCameraStream() async {
    if (_isStreaming) {
      try {
        await cameraController.stopImageStream();
      } catch (e) {
        print("Error stopping camera stream: $e");
      }
      _isStreaming = false;
    }
  }

  void switchCamera() async {
    if (cameras.length > 1) {
      selectedCameraIndex = (selectedCameraIndex + 1) % cameras.length;
      await startCamera(selectedCameraIndex);
    }
  }

  void togglePetMode() {
    isDogMode.toggle();
    loadModel();
  }

  Future<void> initTFLite() async {
    await loadModel();
  }

  Future<void> loadModel() async {
    try {
      interpreterPet.value?.close();
      interpreterEmotion.value?.close();
      interpreterPet.value = null;
      interpreterEmotion.value = null;

      String petModel = isDogMode.value
          ? "assets/models/dog_detection.tflite"
          : "assets/models/cat_detection.tflite";
      String emotionModel = isDogMode.value
          ? "assets/models/dog_emotion.tflite"
          : "assets/models/cat_emotion.tflite";

      interpreterPet.value = await tfl.Interpreter.fromAsset(petModel);
      interpreterEmotion.value = await tfl.Interpreter.fromAsset(emotionModel);
      isInterpreterInitialized(true);
    } catch (e) {
      print("Failed to load TFLite model: $e");
    }
  }

  void processImage(CameraImage image) async {
    if (!isInterpreterInitialized.value || _isProcessing) return;

    _isProcessing = true; // Hindari proses berulang sebelum selesai

    Uint8List input = await compute(convertImageToByteList, image);

    var petOutput = List.filled(1, 0.0).reshape([1, 1]);
    interpreterPet.value!.run(input, petOutput);

    if (petOutput[0][0] > 0.5) {
      var emotionOutput = List.filled(4, 0.0).reshape([1, 4]);
      interpreterEmotion.value!.run(input, emotionOutput);
      print("Emotion detected: $emotionOutput");
    } else {
      print(isDogMode.value ? "Not Dog" : "Not Cat");
    }

    await Future.delayed(Duration(milliseconds: 100));
    _isProcessing = false; // Selesai memproses, bisa lanjut frame berikutnya
  }

  static Uint8List convertImageToByteList(CameraImage image) {
    final int width = image.width;
    final int height = image.height;
    final int numPixels = width * height;
    final Uint8List convertedBytes = Uint8List(numPixels);

    final plane = image.planes[0];
    final Uint8List bytes = plane.bytes;

    for (int i = 0; i < numPixels; i++) {
      convertedBytes[i] = bytes[i];
    }

    return convertedBytes;
  }
}
