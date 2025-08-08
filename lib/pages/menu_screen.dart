import 'package:dit_ya/pages/Post/list_posts_screen.dart';
import 'package:dit_ya/pages/alquran/list_alquran.dart';
import 'package:dit_ya/pages/ganjil/list_ganjil.dart';
import 'package:dit_ya/pages/home__screen.dart';
import 'package:dit_ya/pages/product/product_list.dart';
import 'package:dit_ya/pages/profile_screen.dart';
import 'package:flutter/material.dart';


class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(), // Ganti dari Center(text: ...) ke HomeScreen()
    ListPostScreen(),
    QuranListPage(),
    ProductListPage(),
    ProductListScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Dashboard')),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Posts'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Al-quran'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Ganjil'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Produk',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
