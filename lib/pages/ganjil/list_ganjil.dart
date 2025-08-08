// File: lib/pages/ganjil/product_list_page.dart

import 'package:dit_ya/models/ganjil_model.dart';
import 'package:dit_ya/pages/ganjil/detail_ganjil.dart';
import 'package:dit_ya/service/ganjil_service.dart';
import 'package:flutter/material.dart';


class ProductListPage extends StatelessWidget {
  final ProductService service = ProductService();

  ProductListPage({Key? key})
      : super(key: key); // Tambah constructor dengan key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: FutureBuilder<List<Ganjil>>(
        future: service.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No products found.'));
          }

          final products = snapshot.data!;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                leading: Image.network(
                  product.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image),
                ),
                title: Text(product.title),
                subtitle: Text('\$${product.price}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailPage(productId: product.id),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
