import 'package:epsi_shop/bo/article.dart';
import 'package:epsi_shop/page/about_us_page.dart';
import 'package:epsi_shop/page/cart_page.dart';
import 'package:epsi_shop/page/home_page.dart';
import 'package:epsi_shop/page/paiement_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (_,__) => HomePage(),
      routes: [
        GoRoute(
          path:"cart",
          builder: (_,__) => CartPage(),
            routes: [
              GoRoute(
                  path: "paiement",
                  name: "paiement",
                  builder: (_,__) => PaiementPage())
            ]
        ),GoRoute(
          path:"aboutus",
          builder: (_,__) => AboutUsPage(),
        ),
        GoRoute(
            path: "article",
            name: "article",
            builder: (_,state) => ArticlePage(article: state.extra as Article),
        )
      ]
    )
  ]
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}