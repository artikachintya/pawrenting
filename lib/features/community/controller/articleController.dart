import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/data/repositories/articleRepo.dart';
import 'package:pawrentingreborn/features/community/models/article_models.dart';

class ArticleController extends GetxController {
  final articleRepo = ArticleRepo.instance;
  RxList<ArticleModels> searchResult = <ArticleModels>[].obs;
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

RxBool isSearching = false.obs;
Future<void> searchArticle(String query) async {
  print('Query yang dimasukkan: $query');
  print('Total artikel sebelum filter: ${articlesList.length}');
  // print('isSearching sebelum diubah: ${isSearching.value}');

  if (query.isEmpty) {
    searchResult.clear(); // Kosongkan hasil pencarian
    isSearching.value = false; // Kembali ke tampilan semua artikel
    return;
  } else {
    isSearching.value = true; //  sedang mencari
    searchResult.assignAll(
      articlesList.where((article) => 
        article.title.toLowerCase().startsWith(query.toLowerCase())).toList(),
    );

    print('Total hasil pencarian lokal: ${searchResult.length}');
  }
}


Future<void> searchArticleDog(String query) async {
  print('Query yang dimasukkan: $query');
  print('Total artikel sebelum filter: ${articlesList.length}');
  // print('isSearching sebelum diubah: ${isSearching.value}');

  if (query.isEmpty) {
    searchResult.clear(); // Kosongkan hasil pencarian
    isSearching.value = false; // Kembali ke tampilan semua artikel
    return;
  } else {
    isSearching.value = true; //  sedang mencari
    searchResult.assignAll(
      articlesListDog.where((article) => 
        article.title.toLowerCase().startsWith(query.toLowerCase())).toList(),
    );

    print('Total hasil pencarian lokal: ${searchResult.length}');
  }
}


Future<void> searchArticleCat(String query) async {
  print('Query yang dimasukkan: $query');
  print('Total artikel sebelum filter: ${articlesList.length}');
  // print('isSearching sebelum diubah: ${isSearching.value}');

  if (query.isEmpty) {
    searchResult.clear(); // Kosongkan hasil pencarian
    isSearching.value = false; // Kembali ke tampilan semua artikel
    return;
  } else {
    isSearching.value = true; //  sedang mencari
    searchResult.assignAll(
      articlesListCat.where((article) => 
        article.title.toLowerCase().startsWith(query.toLowerCase())).toList(),
    );

    print('Total hasil pencarian lokal: ${searchResult.length}');
  }
} 
}