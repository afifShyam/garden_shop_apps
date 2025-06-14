import 'package:flutter/material.dart';
import 'package:garden_shop/gen/assets.gen.dart';
import 'package:garden_shop/widgets/index.dart';

class TrendDiscoverSection extends StatelessWidget {
  const TrendDiscoverSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    // Generate ProductCard widgets
    final products = List.generate(4, (index) {
      final isShort = index % 3 == 0;
      return ProductCard(
        imageUrl: 'https://via.placeholder.com/300x20${(index + 1) % 10}',
        subtitle: 'Lorem Ipsum',
        title:
            isShort
                ? 'Lorem ipsum dolor sit amet'
                : 'Lorem ipsum dolor sit amet consectetur adipiscing elit. Lorem',
        price: 'RM ${(index + 1) * 10}.00',
      );
    });

    return Container(
      color: theme.appBarTheme.foregroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner
          Assets.images.trendingDiscoveries.image(width: size.width, fit: BoxFit.cover),

          // Balanced Masonry Grid
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: BalancedMasonryGrid(children: products),
          ),
        ],
      ),
    );
  }
}
