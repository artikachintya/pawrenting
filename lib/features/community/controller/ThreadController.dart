import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pawrentingreborn/data/repositories/ThreadRepo.dart';
import 'package:pawrentingreborn/features/community/models/thread_message.dart';
import 'package:pawrentingreborn/features/home/models/categoryModel.dart';

class ThreadController extends GetxController{
  final threadRepo = ThreadRepo.instance;
  // ThreadController threadController = Get.put(ThreadController());

  RxList<ThreadMessage> threadsList = <ThreadMessage>[].obs;

    void onInit() {
    // TODO: implement onInit
    fetchThreads();
    super.onInit();
  }

  Future<void> fetchThreads() async {
    // final snapshot = await threadRepo.fetchThread();
    final threads = await threadRepo.fetchThread();
    threadsList.assignAll(threads);
  }


}