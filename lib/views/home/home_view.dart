import 'package:flutter/material.dart';
import 'package:garden_shop/gen/assets.gen.dart';
import 'package:garden_shop/views/index.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: const PreferredSize(preferredSize: Size.fromHeight(250), child: HomeAppBar()),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 25,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Assets.images.image.image(
                width: MediaQuery.sizeOf(context).width,
                fit: BoxFit.cover,
              ),
            ),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                _buildNavButton(context, 'Shop'),
                _buildNavButton(context, 'Services'),
                _buildNavButton(context, 'Posts'),
              ],
            ),

            // Circle icon list
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 24),
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: 78,
                    height: 78,
                    decoration: ShapeDecoration(
                      shape: const CircleBorder(),
                      color: theme.scaffoldBackgroundColor,
                    ),
                    child: Assets.images.buttonIcon1.image(),
                  );
                },
              ),
            ),
            ServicesSection(theme: theme, colorScheme: colorScheme),
            TrendDiscoverSection(),
            LocationSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(BuildContext context, String text) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        fixedSize: const Size.fromWidth(100),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: () {},
      child: Text(text),
    );
  }
}
