import 'dart:convert';

import 'package:epsi_shop/bo/article.dart';
import 'package:epsi_shop/bo/cart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  
  final List<Article> articles = [
    Article(nom: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday", prix: 10995, categorie: "men's clothing"),
    Article(nom: "Mens Casual Premium Slim Fit T-Shirts ", image: "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg", description: "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.", prix: 2230, categorie: "men's clothing"),
    Article(nom: "Mens Cotton Jacket", image: "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg", description: "great outerwear jackets for Spring/Autumn/Winter, suitable for many occasions, such as working, hiking, camping, mountain/rock climbing, cycling, traveling or other outdoors. Good gift choice for you or your family member. A warm hearted love to Father, husband or son in this thanksgiving or Christmas Day.", prix: 5599, categorie: "men's clothing")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Shop", style: TextStyle(
          color: Colors.white
        ),)),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: [
          IconButton(
            onPressed: () => context.go('/cart'),
            icon: Badge(
              label: Text("${context.watch<Cart>().listArticles.length}"),
                child: Icon(Icons.shopping_cart)
            )
          ),
          IconButton(
            onPressed: () => context.go('/aboutus'),
            icon: Icon(Icons.info_outline)
          )
        ],
      ),
      body: FutureBuilder<List<Article>>(
          future: fetchListProducts(),
          builder: (context, snapshot) =>
          switch(snapshot.connectionState){
            ConnectionState.done when snapshot.data != null =>
              ListArticles(articles: snapshot.data!),
            ConnectionState.waiting => Center(child: CircularProgressIndicator()),
            _ => const Icon(Icons.error)
          })
    );
  }


  Future<List<Article>> fetchListProducts() async {
    String uri = "https://fakestoreapi.com/products";
    Response resListArt = await get(Uri.parse(uri));
    // si la requête s'est bien passé et que le corps de la réponse n'est pas vide
    if (resListArt.statusCode == 200 && resListArt.body.isNotEmpty) {
      final resListMap = jsonDecode(resListArt.body) as List<dynamic>;
      return resListMap
          .map<Article>((map) => Article.fromMap(map as Map<String,dynamic>))
          .toList();
    } else {
      throw Exception("Pas de message reçu du serveur");
    }
  }
}

class ListArticles extends StatelessWidget {
  const ListArticles({
    super.key,
    required this.articles,
  });

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: Image.network(articles[index].image, width: 80,),
        title: Text(articles[index].nom, style: TextStyle(
            fontSize: 14
          ),
        ),
        subtitle: Text(articles[index].getPrixEuro()),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                context.read<Cart>().add(articles[index]);
              },
              child: Text("Ajouter", style: TextStyle(
                  color: Theme.of(context).colorScheme.primary
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                context.goNamed("article", extra: articles[index]);
              },
              child: Text("Détails", style: TextStyle(
                  color: Theme.of(context).colorScheme.primary
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
