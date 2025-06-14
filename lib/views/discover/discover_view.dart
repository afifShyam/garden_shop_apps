import 'package:flutter/material.dart';
import 'package:garden_shop/gen/assets.gen.dart';

import 'package:garden_shop/widgets/index.dart';

class DiscoverView extends StatelessWidget {
  const DiscoverView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: const StandardAppBar(title: 'Discover'),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Friendly intro
          Text(
            "Let's Discover 🌿",
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Explore recommended picks, curated collections, and trending products we think you’ll love.',
            style: textTheme.bodyMedium?.copyWith(color: theme.hintColor),
          ),

          const SizedBox(height: 24),

          // Recommended Section
          _SectionTitle(title: 'Recommended for You'),
          const SizedBox(height: 12),
          const _HorizontalCardList(),

          const SizedBox(height: 32),

          // Trending Section
          _SectionTitle(title: 'Trending Now'),
          const SizedBox(height: 12),
          const _HorizontalImageList(),

          const SizedBox(height: 32),

          // Categories Section
          _SectionTitle(title: 'Browse Categories'),
          const SizedBox(height: 12),
          const _CategoryGrid(),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.primary,
      ),
    );
  }
}

class _HorizontalCardList extends StatelessWidget {
  const _HorizontalCardList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return ProductCard(
            imageUrl: Assets.images.image.path,
            subtitle: 'subtitle',
            title: 'title',
            price: 'price',
          );
        },
      ),
    );
  }
}

class _HorizontalImageList extends StatelessWidget {
  const _HorizontalImageList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (_, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Assets.images.image.image(),
          );
        },
      ),
    );
  }
}

class _CategoryGrid extends StatelessWidget {
  const _CategoryGrid();

  @override
  Widget build(BuildContext context) {
    final categories = ['Flowers', 'Plants', 'Tools', 'Decor', 'Gifts', 'Seeds'];

    return GridView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemBuilder: (_, index) {
        return Column(
          children: [
            Container(
              height: 64,
              width: 64,
              decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFF4F4F4)),
              child: Assets.images.buttonIcon1.image(),
            ),
            const SizedBox(height: 6),
            Text(categories[index], style: Theme.of(context).textTheme.bodySmall),
          ],
        );
      },
    );
  }
}
