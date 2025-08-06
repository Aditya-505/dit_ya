import 'package:dit_ya/pages/alquran/list_alquran.dart';
import 'package:dit_ya/pages/Post/list_posts_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('fetch Data')),
        body: ListAlquranScreen(),
      ),
    );
  }
}