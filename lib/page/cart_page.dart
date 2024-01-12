import 'package:epsi_shop/bo/article.dart';
import 'package:epsi_shop/bo/cart.dart';
import 'package:epsi_shop/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Panier Flutter Sales", style: TextStyle(
          color: Colors.white
        ),)),
        backgroundColor: Theme.of(context).colorScheme.primary
      ),
      body: Consumer<Cart>(builder: (BuildContext context, Cart cart, Widget? child) {
        return cart.listArticles.isEmpty ?
        EmptyCart() : ListCart(
            listArticles: cart.listArticles,
            prixEuro: cart.getTotalPrice(),
        );
      },
      )
    );
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: [
            Spacer(),
            Text("Votre panier est actuellement vide"),
            Icon(Icons.image),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class ListCart extends StatelessWidget {
  final List<Article> listArticles;
  final String prixEuro;
  const ListCart({
    required this.listArticles,
    required this.prixEuro
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Votre panier total est de"),
                Text(prixEuro,
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: listArticles.length,
              itemBuilder: (BuildContext context, int index) => ListTile(
                leading: Image.network(listArticles[index].image, width: 80,),
                title: Text(listArticles[index].nom),
                subtitle: Text(listArticles[index].getPrixEuro()),
                trailing: IconButton(
                    onPressed: () {
                      context.read<Cart>().remove(listArticles[index]);
                    },
                    icon: Icon(Icons.delete)
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed("paiement");
            },
            child: Text("Procéder au paiement", style: TextStyle(
                color: Colors.white,
                fontSize: 20.0
            ),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary
            ),
          ),
        ]
    );
  }
}

class ArticlePage extends StatelessWidget {
  final Article article;
  const ArticlePage({
    required this.article
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Détail de l'article", style: TextStyle(
          color: Colors.white
        ),)),
        backgroundColor: Theme.of(context).colorScheme.primary
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Image.network(article.image, width: 120,),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(article.nom, style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(article.description, style: TextStyle(
                    fontSize: 16
                  ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(article.getPrixEuro(), style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(article.categorie, style: TextStyle(
                    fontSize: 20
                  ),),
                ),
              ),
              Spacer(),
              ElevatedButton(
                      onPressed: () {
                        context.read<Cart>().add(article);
                      },
                      child: Text("AJOUTER AU PANIER", style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 20.0
                      ),
                      ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
