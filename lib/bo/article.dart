class Article {
  String nom;
  final String image;
  String description;
  int prix;
  String categorie;

  Article({
    required this.nom,
    required this.image,
    required this.description,
    required this.prix,
    required this.categorie
  });

  String getPrixEuro() => "${prix/100} €";

  Map<String, dynamic> toMap() {
    return {
      'nom': this.nom,
      'image': this.image,
      'description': this.description,
      'prix': this.prix,
      'categorie': this.categorie,
    };
  }

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      nom: map['title'] as String,
      image: map['image'] as String,
      description: map['description'] as String,
      prix: ((map['price'] as num) * 100).floor(),
      categorie: map['category'] as String,
    );
  }
}

void main() {
  final listArticle = [
    Article(nom: "Hummer", image: "bigHummer.png", description: "BigHummer", prix: 25000000, categorie: "voiture"),
    Article(nom: "Twingo Drift", image: "twingo.png", description: "Mini Twingo Drift sheesh", prix: 805000, categorie: "voiture")
  ];

  print(listArticle[0].nom + ": " + listArticle[0].getPrixEuro());
}