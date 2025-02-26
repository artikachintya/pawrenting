import 'package:get/get.dart';
import 'package:pawrentingreborn/data/repositories/articleRepo.dart';
import 'package:pawrentingreborn/features/community/models/article_models.dart';

class ArticleController extends GetxController {
  final articleRepo = ArticleRepo.instance;

  RxList<ArticleModels> articlesList = <ArticleModels>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    final articles = await articleRepo.fetchArticles();
    articlesList.assignAll(articles);
  }
}