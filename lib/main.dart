import 'package:dit_ya/pages/alquran/list_alquran.dart';
import 'package:dit_ya/pages/Post/list_posts_screen.dart';
import 'package:dit_ya/pages/auth/login_screen.dart';
import 'package:dit_ya/pages/home__screen.dart';
import 'package:dit_ya/service/auth_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final authService = AuthService();
  final isLoggedIn = await authService.isLoggedIn();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: isLoggedIn ? HomeScreen() : LoginScreen(),
  ));
}
