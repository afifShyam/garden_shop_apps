import 'package:flutter/material.dart';
import 'package:garden_shop/gen/assets.gen.dart';
import 'package:garden_shop/widgets/index.dart';

class ProductDetailView extends StatelessWidget {
  final String productId;
  final String imageUrl;
  final String title;
  final String subtitle;
  final String price;

  const ProductDetailView({
    super.key,
    required this.productId,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: StandardAppBar(title: 'Product Details', centerTitle: true, showBack: true),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
              backgroundColor: colorScheme.primary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () {
              // Handle add to cart
            },
            child: const Text(
              'Add to Cart',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Assets.images.image.image(),
            // Image.network(imageUrl, height: 250, width: double.infinity, fit: BoxFit.cover),
          ),
          const SizedBox(height: 20),

          // Title & Price
          Text(title, style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(subtitle, style: textTheme.bodyMedium?.copyWith(color: Colors.grey[600])),
          const SizedBox(height: 12),
          Text(
            price,
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: 24),

          // Description Placeholder
          Text('Description', style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(
            'This plant is perfect for your home. Easy to maintain, freshens air and adds beauty to your space. Perfect for indoor or shaded outdoor placement.',
            style: TextStyle(height: 1.5),
          ),
        ],
      ),
    );
  }
}
