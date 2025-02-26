import 'package:get/get.dart';
import 'package:pawrentingreborn/data/repositories/articleRepo.dart';
import 'package:pawrentingreborn/features/community/models/article_models.dart';

class ArticleController extends GetxController {
  final articleRepo = ArticleRepo.instance;

  RxList<Article> articlesList = <Article>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    final articles = await articleRepo.fetchArticles();
    articlesList.assignAll(articles);
  }

  Future<void> addArticle(Article article) async {
    await articleRepo.createArticle(article);
    fetchArticles();  // Optionally, refresh the list after adding a new article.
  }
}
