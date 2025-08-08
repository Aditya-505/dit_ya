// File: lib/pages/ganjil/detail_ganjil.dart

import 'package:flutter/material.dart';
import 'package:dit_ya/models/ganjil_model.dart';
import 'package:dit_ya/service/ganjil_service.dart';

class ProductDetailPage extends StatelessWidget {
  final int productId;
  final ProductService service = ProductService();

  ProductDetailPage({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Detail')),
      body: FutureBuilder<Ganjil>(
        future: service.fetchProductById(productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Product not found.'));
          }

          final product = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    product.image,
                    width: 200,
                    height: 200,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image, size: 100),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  product.title,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  '\$${product.price}',
                  style: const TextStyle(fontSize: 20, color: Colors.green),
                ),
                const SizedBox(height: 16),
                Text(
                  product.description ?? 'No description available.',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
