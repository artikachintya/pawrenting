import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/data/repositories/articleRepo.dart';
import 'package:pawrentingreborn/features/community/models/article_models.dart';

class ArticleController extends GetxController {
  final articleRepo = ArticleRepo.instance;

  RxList<ArticleModels> articlesList = <ArticleModels>[].obs;
  RxList<ArticleModels> articlesListCat = <ArticleModels>[].obs;
  RxList<ArticleModels> articlesListDog = <ArticleModels>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchArticles('category');
    fetchArticlesCat();
    fetchArticlesDog();

  }

  Future<void> fetchArticles(String category) async {
  final articles = await articleRepo.fetchArticles(category: category);
  articlesList.assignAll(articles);
}
  Future<void> fetchArticlesCat() async {
  final articles = await articleRepo.fetchArticles(category: 'cat');
  articlesListCat.assignAll(articles);
}

  Future<void> fetchArticlesDog() async {
  final articles = await articleRepo.fetchArticles(category: 'dog');
  articlesListDog.assignAll(articles);
}

}