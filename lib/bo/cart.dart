import 'package:epsi_shop/bo/article.dart';
import 'package:flutter/material.dart';


class Cart with ChangeNotifier {
  final _listArticles = <Article>[];

  List<Article> get listArticles => _listArticles;

  String getTotalPrice() =>
      "${listArticles.fold(0, (prev, art) => prev + art.prix)/100}€";

  String getTVA() =>
      "${(listArticles.fold(0, (prev, art) => prev + art.prix)/100) * 0.2 }";

  String getTotal() =>
      "${(listArticles.fold(0, (prev, art) => prev + art.prix)/100) * 1.2 }";

  void add(Article article) {
    _listArticles.add(article);
    notifyListeners();
  }

  void remove(Article article) {
    _listArticles.remove(article);
    notifyListeners();
  }

  void removeAll() {
    _listArticles.clear();
    notifyListeners();
  }
}