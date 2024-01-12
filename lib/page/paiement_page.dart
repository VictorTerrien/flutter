import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaiementPage extends StatelessWidget {
  PaiementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Finalisation de la commande"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CardRecap(),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                  child: Text("Adresse de livraison", style: TextStyle(
                    fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                  )
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CardAdresse(),
              ),
              const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Méthode de paiement", style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                  )
              ),
              MethodePaiement(),
            ],
          )
        ),
    );
  }
}

class CardRecap extends StatelessWidget {
  const CardRecap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Récapitulatif de votre commande", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0
                ),),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sous-Total"),
                  Text("129.36€")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Vous économisez", style: TextStyle(color: Colors.green),),
                  Text("-0.01€", style: TextStyle(color: Colors.green),),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("TVA"),
                  Text("23.89€")
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("TOTAL", style: TextStyle(fontWeight: FontWeight.bold),),
                Text("153.25€", style: TextStyle(fontWeight: FontWeight.bold),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardAdresse extends StatelessWidget {
  const CardAdresse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: Theme.of(context).colorScheme.outline),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Michel Le Poney", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0
                  ),)
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("8 rue des ouvertures de portes"),
                Icon(Icons.chevron_right),
              ],
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("93204 CORBEAUX")
            ),
          ],
        ),
      ),
    );
  }
}

class MethodePaiement extends StatefulWidget {
  @override
  State createState() => _MethodePaiement();
}

class _MethodePaiement extends State<MethodePaiement> {
  bool isPressed = false;
  int paiementMethode = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
        children: [

          IconButton(onPressed: () { setState(() {
            isPressed = true;
            paiementMethode = 1;
          }); }
              , icon: Badge(
                label: paiementMethode==1?FaIcon(FontAwesomeIcons.check, size: 11.0, color: Colors.white,):null,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(color: Theme.of(context).colorScheme.outline),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FaIcon(FontAwesomeIcons.ccApplePay, size: 40.0, color: paiementMethode==1?Theme.of(context).colorScheme.primary:Colors.black,),
                  ),
                ),
              ),
              ),
          IconButton(onPressed: () { setState(() {
            isPressed = true;
            paiementMethode = 2;
          }); }
              , icon: Badge(
              label: paiementMethode==2?FaIcon(FontAwesomeIcons.check, size: 11.0, color: Colors.white,):null,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color: Theme.of(context).colorScheme.outline),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FaIcon(FontAwesomeIcons.ccVisa, size: 40.0, color: paiementMethode==2?Theme.of(context).colorScheme.primary:Colors.black,),
                ),
              ),
            ),
          ),
          IconButton(onPressed: () { setState(() {
            isPressed = true;
            paiementMethode = 3;
          }); }
              , icon: Badge(
              label: paiementMethode==3?FaIcon(FontAwesomeIcons.check, size: 11.0, color: Colors.white,):null,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color: Theme.of(context).colorScheme.outline),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FaIcon(FontAwesomeIcons.ccMastercard, size: 40.0, color: paiementMethode==3?Theme.of(context).colorScheme.primary:Colors.black,),
                ),
              ),
            ),
              ),
          IconButton(onPressed: () { setState(() {
            isPressed = true;
            paiementMethode = 4;
          }); }
              , icon: Badge(
              label: paiementMethode==4?FaIcon(FontAwesomeIcons.check, size: 11.0, color: Colors.white,):null,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color: Theme.of(context).colorScheme.outline),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FaIcon(FontAwesomeIcons.ccPaypal, size: 40.0, color: paiementMethode==4?Theme.of(context).colorScheme.primary:Colors.black,),
                ),
              ),
            ),
          ),
        ],

      ),
        const Text("En cliquant \"Confirmer l'achat\", vous acceptez les Conditions de vente de EPSI SHOP International. Besoin d'aide ? Désolé on peut rien faire",
          style: TextStyle(fontSize: 11.0),),
         const Text("En poursuivant, vous acceptez les Conditions d'utilisation du fournisseur de paiement CoffeDis",
          style: TextStyle(fontSize: 11.0),),
        ElevatedButton(
          onPressed: isPressed?() { }:null,
          style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          child: const Text("Confirmer l'achat", style: TextStyle(
              color: Colors.white
          ),),
        )
      ]
    );

  }
}