import 'package:flutter/material.dart';
import 'package:garden_shop/gen/assets.gen.dart';
import 'package:garden_shop/widgets/index.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key, required this.theme, required this.colorScheme});

  final ThemeData theme;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      color: theme.scaffoldBackgroundColor,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New Services',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
              Text(
                'View All',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: colorScheme.primary,
                ),
              ),
            ],
          ),
          Text(
            'Recommended Based on Your Preferences',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: colorScheme.primary,
            ),
          ),
          SizedBox(
            height: 318,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return const ProductCard(
                  imageUrl: '',
                  title: 'This is a flower shop, you can buy flower here.',
                  subtitle: 'Flower',
                  price: 'RM100',
                );
              },
            ),
          ),
          const SizedBox(height: 25),
          CategoryScrollSlider(
            icons: [
              Assets.images.shopPlantsIcon1.image(),
              Assets.images.shopPlantsIcon2.image(),
              Assets.images.shopPlantsIcon3.image(),
              Assets.images.shopPlantsIcon4.image(),
              Assets.images.shopPlantsIcon5.image(),
            ],
          ),
        ],
      ),
    );
  }
}
