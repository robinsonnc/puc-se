import 'package:firebase_auth/firebase_auth.dart';

class Constants {

  static const sizeFactor = 0.22;
  static const heightFactor = 0.85;

  static const cardHeightFactor = 0.31;
  static const cardWidthFactor = 0.4;
  // static const cardTopFactor = 0.033;
  static const cardTopFactor = 0.05;
  static const textCardTopFactor = 0.11;

  // static const listViewHeightFactor = 0.1;

  static final List<String> offerImages = [
    'assets/images/offer/Offer1.jpg',
    'assets/images/offer/Offer2.jpg',
    'assets/images/offer/Offer3.jpg',
    'assets/images/offer/Offer4.jpg',
  ];

  static final List<String> authImagesPaths = [
    'assets/images/landing/buy-on-laptop.jpg',
    'assets/images/landing/buy-through.png',
    'assets/images/landing/buyfood.jpg',
    'assets/images/landing/grocery-cart.jpg',
    'assets/images/landing/grocery-cart.jpg',
    'assets/images/landing/store.jpg',
    'assets/images/landing/vegetablebg.jpg',
  ];

  // static final List<String> authImagesPaths = [
  //   'assets/images/landing/brigadeiro.jpg',
  //   'assets/images/landing/coffee-1.jpg',
  //   'assets/images/landing/doceria.jpg',
  //   'assets/images/landing/farmacia.jpg',
  //   'assets/images/landing/market.jpg',
  //   'assets/images/landing/mercado.jpg',
  //   'assets/images/landing/restaurante-1.jpg',
  // ];

  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
}