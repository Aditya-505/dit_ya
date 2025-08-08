// File: lib/service/product.service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dit_ya/models/ganjil_model.dart';

class ProductService {
  final String baseUrl = 'https://fakestoreapi.com/products';

  // Fetch list of products
  Future<List<Ganjil>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Ganjil.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  // Fetch product detail by ID
  Future<Ganjil> fetchProductById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return Ganjil.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load product detail');
    }
  }
}
