import 'package:flutter/material.dart';
import 'package:meu_pedido/models/store_profile_model.dart';

const DUMMY_STORES = const [
  StoreProfileModel(
    id: '11',
    storeName: 'Restaurante do Chevette',
    imageUrl: 'assets/images/logos/chevette.jpg',
    availableTables: 25,
    distance: 2,
    grade: 4.7,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Colors.blue, //Color(0xFF993F64),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFF745660),
      onSecondary: Color(0xFFFFFFFF),
      error: Color(0xFFBA1A1A),
      onError: Color(0xFFFFFFFF),
      background: Color(0xFFFFFBFF),
      onBackground: Color(0xFF201A1C),
      surface: Color(0xFFFFFBFF),
      onSurface: Color(0xFF201A1C),
    ),
  ),
  StoreProfileModel(
    id: '12',
    storeName: 'Café Merlot',
    imageUrl: 'assets/images/logos/cafe-merlot.jpg',
    availableTables: 10,
    distance: 1,
    grade: 4.7,

    // Thunderbird red palette
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFFFB4AA),
      onPrimary: Color(0xFF690003),
      primaryContainer: Color(0xFF930006),
      onPrimaryContainer: Color(0xFFFFDAD5),
      secondary: Color(0xFFE7BDB7),
      onSecondary: Color(0xFF442926),
      secondaryContainer: Color(0xFF5D3F3B),
      onSecondaryContainer: Color(0xFFFFDAD5),
      tertiary: Color(0xFFDFC38C),
      onTertiary: Color(0xFF3F2E04),
      tertiaryContainer: Color(0xFF574419),
      onTertiaryContainer: Color(0xFFFCDFA6),
      error: Color(0xFFFFB4AB),
      errorContainer: Color(0xFF93000A),
      onError: Color(0xFF690005),
      onErrorContainer: Color(0xFFFFB4AB),
      background: Color(0xFF201A19),
      onBackground: Color(0xFFEDE0DE),
      surface: Color(0xFF201A19),
      onSurface: Color(0xFFEDE0DE),
      surfaceVariant: Color(0xFF534341),
      onSurfaceVariant: Color(0xFFD8C2BE),
      outline: Color(0xFFA08C8A),
      onInverseSurface: Color(0xFF362F2E),
      inverseSurface: Color(0xFFEDE0DE),
      inversePrimary: Color(0xFFBB1614),
      shadow: Color(0xFF000000),
      surfaceTint: Color(0xFFFFB4AA),
      outlineVariant: Color(0xFF534341),
      scrim: Color(0xFF000000),
    ),

    // colorScheme: ColorScheme(
    //   brightness: Brightness.dark,
    //   primary: Color(0xFFFFB0CB),
    //   onPrimary: Color(0xFF5E0E35),
    //   secondary: Color(0xFFE2BDC7),
    //   onSecondary: Color(0xFF422932),
    //   error: Color(0xFFFFB4AB),
    //   onError: Color(0xFF690005),
    //   background: Color(0xFF201A1C),
    //   onBackground: Color(0xFFEBE0E1),
    //   surface: Color(0xFF201A1C),
    //   onSurface: Color(0xFFEBE0E1),
    // ),
  ),
  StoreProfileModel(
    id: '13',
    storeName: 'Burger King',
    imageUrl: 'assets/images/logos/burger-king.jpg',
    availableTables: 17,
    distance: 5,
    grade: 4.1,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF993F64),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFF745660),
      onSecondary: Color(0xFFFFFFFF),
      error: Color(0xFFBA1A1A),
      onError: Color(0xFFFFFFFF),
      background: Color(0xFFFFFBFF),
      onBackground: Color(0xFF201A1C),
      surface: Color(0xFFFFFBFF),
      onSurface: Color(0xFF201A1C),
    ),
  ),
  StoreProfileModel(
    id: '14',
    storeName: 'Vecchio Cancian',
    imageUrl: 'assets/images/logos/vecchio-cancian.jpg',
    availableTables: 19,
    distance: 1.5,
    grade: 4.6,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF993F64),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFF745660),
      onSecondary: Color(0xFFFFFFFF),
      error: Color(0xFFBA1A1A),
      onError: Color(0xFFFFFFFF),
      background: Color(0xFFFFFBFF),
      onBackground: Color(0xFF201A1C),
      surface: Color(0xFFFFFBFF),
      onSurface: Color(0xFF201A1C),
    ),
  ),
  StoreProfileModel(
    id: '15',
    storeName: 'Sal e Grill',
    imageUrl: 'assets/images/logos/sal-grill.jpg',
    availableTables: 21,
    distance: 0.5,
    grade: 4.4,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF993F64),
      onPrimary: Color(0xFFFFFFFF),
      secondary: Color(0xFF745660),
      onSecondary: Color(0xFFFFFFFF),
      error: Color(0xFFBA1A1A),
      onError: Color(0xFFFFFFFF),
      background: Color(0xFFFFFBFF),
      onBackground: Color(0xFF201A1C),
      surface: Color(0xFFFFFBFF),
      onSurface: Color(0xFF201A1C),
    ),
  ),
];
