import 'package:flutter/material.dart';
import 'package:garden_shop/gen/assets.gen.dart'; // adjust path if needed

class CategoryScrollSlider extends StatefulWidget {
  final List<Widget> icons;

  const CategoryScrollSlider({super.key, required this.icons});

  @override
  State<CategoryScrollSlider> createState() => _CategoryScrollSliderState();
}

class _CategoryScrollSliderState extends State<CategoryScrollSlider> {
  final ScrollController _scrollController = ScrollController();

  static const double itemSize = 80.0;
  static const double spacing = 16.0;
  static const double sidePadding = 5.0;
  static const double pillWidth = 60.0;

  double scrollProgress = 0.0;
  double trackWidth = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_syncScrollToIndicator);
  }

  void _syncScrollToIndicator() {
    if (!_scrollController.hasClients || trackWidth == 0) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    if (maxScroll > 0) {
      setState(() {
        scrollProgress = (_scrollController.offset / maxScroll).clamp(0.0, 1.0);
      });
    }
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final dx = details.localPosition.dx;
    final indicatorPos = (dx - pillWidth / 2).clamp(0.0, trackWidth - pillWidth);
    setState(() {
      scrollProgress = indicatorPos / (trackWidth - pillWidth);
    });

    final maxScroll = _scrollController.position.maxScrollExtent;
    final targetOffset = scrollProgress * maxScroll;
    _scrollController.jumpTo(targetOffset);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_syncScrollToIndicator);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        trackWidth = constraints.maxWidth - (2 * sidePadding);
        final indicatorOffset = (trackWidth - pillWidth) * scrollProgress;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: itemSize,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: sidePadding),
                    child: Assets.images.shopPlantsIconMain.image(
                      height: itemSize,
                      width: itemSize,
                      fit: BoxFit.contain,
                    ),
                  ),

                  Expanded(
                    child: Stack(
                      children: [
                        ListView.separated(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(right: sidePadding),
                          itemCount: widget.icons.length,
                          separatorBuilder: (_, __) => const SizedBox(width: spacing),
                          itemBuilder: (context, index) {
                            return Container(
                              width: itemSize,
                              height: itemSize,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: theme.colorScheme.surface,
                              ),
                              alignment: Alignment.center,
                              child: widget.icons[index],
                            );
                          },
                        ),

                        Positioned(
                          left: 0,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: 30,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  theme.scaffoldBackgroundColor,
                                  theme.scaffoldBackgroundColor.withValues(alpha: 0),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: sidePadding),
              child: SizedBox(
                height: 15,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(height: 2, width: trackWidth, color: theme.primaryColor),
                    Positioned(
                      left: indicatorOffset,
                      child: GestureDetector(
                        onHorizontalDragUpdate: _onDragUpdate,
                        child: Container(
                          width: pillWidth,
                          height: 7,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
