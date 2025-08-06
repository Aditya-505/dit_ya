import 'dart:convert';
import 'package:dit_ya/models/posts_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostService {
  static const String postsUrl = 'https://jsonplaceholder.typicode.com/posts';

  static Future<List<PostModel>> listPost() async {
    final response = await http.get(Uri.parse(postsUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => PostModel.fromJson(item)).toList();
    } else {
      throw Exception('Gagal Load Data Post');
    }
  }
}
