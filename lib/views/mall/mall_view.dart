import 'package:flutter/material.dart';
import 'package:garden_shop/views/mall/index.dart';
import 'package:garden_shop/widgets/index.dart';

class MallView extends StatelessWidget {
  const MallView({super.key});

  @override
  Widget build(BuildContext context) {
    final products = List.generate(20, (index) {
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

    return Scaffold(
      appBar: const StandardAppBar(title: 'Mall'),
      body: CustomScrollView(
        slivers: [
          // Sticky search bar
          SliverPersistentHeader(
            pinned: true,
            delegate: StickySearchBarDelegate(child: const MallSearchBar()),
          ),

          // Grid content (non-sticky)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: BalancedMasonryGrid(children: products),
            ),
          ),
        ],
      ),
    );
  }
}
