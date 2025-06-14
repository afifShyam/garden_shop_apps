import 'package:flutter/material.dart';
import 'package:garden_shop/gen/assets.gen.dart';
import 'package:garden_shop/viewmodels/index.dart';

import 'package:garden_shop/widgets/index.dart';
import 'package:provider/provider.dart';

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

          _SectionTitle(title: 'Recommended for You'),
          const SizedBox(height: 12),
          const _HorizontalCardList(),

          const SizedBox(height: 32),

          _SectionTitle(title: 'Trending Now'),
          const SizedBox(height: 12),
          const _HorizontalImageList(),

          const SizedBox(height: 32),

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

class _HorizontalCardList extends StatefulWidget {
  const _HorizontalCardList();

  @override
  State<_HorizontalCardList> createState() => _HorizontalCardListState();
}

class _HorizontalCardListState extends State<_HorizontalCardList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DiscoverViewModel>().loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<DiscoverViewModel>();

    if (model.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return SizedBox(
      height: 330,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: model.recommended.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final product = model.recommended[index];
          return ProductCard(
            imageUrl: product.imageUrl,
            title: product.title,
            subtitle: product.subtitle,
            price:
                product.discountPrice > 0 ? 'RM ${product.discountPrice}' : 'RM ${product.price}',
            discountPercent: product.discountPercent,
            discountPrice: product.discountPrice,
            isDiscount: product.discountPrice > 0,
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
