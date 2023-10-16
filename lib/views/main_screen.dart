import 'package:flutter/material.dart';
import 'package:meu_pedido/views/profile_screen.dart';

import 'cart_screen.dart';
import 'favorites_screen.dart';
import 'home_screen.dart';
import 'orders_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  static const routeName = '/MainScreen';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _selectedScreenIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    FavoritesScreen(),
    CartScreen(),
    OrdersScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFE5E5E5),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedScreenIndex,
        onTap: (value) {
          setState(() {
            _selectedScreenIndex = value;
          });
        },
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        selectedItemColor:
            Theme.of(context).colorScheme.primary, // Colors.yellow.shade900,
        selectedLabelStyle: TextStyle(fontSize: 9),
        unselectedLabelStyle: TextStyle(fontSize: 9),
        items: const [
          // BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorito'),
          BottomNavigationBarItem(
            label: 'Início',
            icon: ImageIcon(
                AssetImage('assets/icons/home-96(-xxxhdpi)-outlined.png')),
            activeIcon: ImageIcon(
                AssetImage('assets/icons/home-96(-xxxhdpi)-filled.png')),
          ),
          BottomNavigationBarItem(
            label: 'Favoritos',
            icon: ImageIcon(
                AssetImage('assets/icons/gostar-96(-xxxhdpi)-outlined.png')),
            activeIcon: ImageIcon(
                AssetImage('assets/icons/gostar-96(-xxxhdpi)-filled.png')),
          ),
          BottomNavigationBarItem(
            label: 'Pedidos',
            icon: ImageIcon(
                AssetImage('assets/icons/note-96(-xxxhdpi)-outlined.png')),
            activeIcon: ImageIcon(
                AssetImage('assets/icons/note-96(-xxxhdpi)-filled.png')),
          ),
          BottomNavigationBarItem(
            label: 'Carrinho',
            icon: ImageIcon(
                AssetImage('assets/icons/cart-96(-xxxhdpi)-outlined.png')),
            activeIcon: ImageIcon(
                AssetImage('assets/icons/cart-96(-xxxhdpi)-filled.png')),
          ),
          BottomNavigationBarItem(
            label: 'Perfil',
            icon: ImageIcon(
                AssetImage('assets/icons/user-96(-xxxhdpi)-outlined.png')),
            activeIcon: ImageIcon(
                AssetImage('assets/icons/user-96(-xxxhdpi)-filled.png')),
          ),
        ],
      ),
      body: _screens[_selectedScreenIndex],
    );
  }
}
