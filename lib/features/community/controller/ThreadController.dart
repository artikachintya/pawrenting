import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pawrentingreborn/data/repositories/ThreadRepo.dart';
import 'package:pawrentingreborn/features/community/models/thread_message.dart';
import 'package:pawrentingreborn/features/home/models/categoryModel.dart';

class ThreadController extends GetxController {
  final threadRepo = ThreadRepo.instance;
  // ThreadController threadController = Get.put(ThreadController());

  RxList<ThreadMessage> threadsList = <ThreadMessage>[].obs;
  RxList<ThreadMessage> searchResults = <ThreadMessage>[].obs;

  void onInit() {
    // TODO: implement onInit
    fetchThreads();
    super.onInit();
  }

  Future<void> fetchThreads() async {
    threadsList.clear();
    // final snapshot = await threadRepo.fetchThread();
    final threads = await threadRepo.fetchThread();
    threadsList.assignAll(threads);
  }

  void updateThread(String threadId) async {
    final threadIndex =
        threadsList.indexWhere((thread) => thread.id == threadId);
    if (threadIndex != -1) {
      threadsList[threadIndex].commentCount++;
      print(threadsList[threadIndex].commentCount);
      await threadRepo.updateThread(threadsList[threadIndex]);
      threadsList.refresh();
    }
  }

  RxBool isSearching = false.obs;
  Future<void> searchThread(String query) async {
    print('Query yang dimasukkan: $query');
    print('Total thread sebelum filter: ${threadsList.length}');

    if (query.isEmpty) {
      searchResults.clear(); // Kosongkan hasil pencarian
      isSearching.value = false; // Kembali ke tampilan semua thread
      return;
    } else {
      isSearching.value = true; //  sedang mencari
      searchResults.assignAll(
        threadsList
            .where((thread) =>
                thread.title.toLowerCase().startsWith(query.toLowerCase()))
            .toList(),
      );

      print('Total hasil pencarian lokal: ${searchResults.length}');
    }
  }
}
