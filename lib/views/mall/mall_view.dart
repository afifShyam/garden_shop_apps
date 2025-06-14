import 'package:flutter/material.dart';
import 'package:garden_shop/viewmodels/index.dart';
import 'package:garden_shop/views/mall/index.dart';
import 'package:garden_shop/widgets/index.dart';
import 'package:provider/provider.dart';

class MallView extends StatefulWidget {
  const MallView({super.key});

  @override
  State<MallView> createState() => _MallViewState();
}

class _MallViewState extends State<MallView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<MallViewModel>().loadProducts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StandardAppBar(title: 'Mall'),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: StickySearchBarDelegate(
              child: MallSearchBar(
                onChanged: (query) {
                  context.read<MallViewModel>().searchProducts(query);
                },
                onFilterPressed: () {
                  final vm = context.read<MallViewModel>();

                  showPriceFilterSheet(
                    context,
                    currentMin: vm.minPrice,
                    currentMax: vm.maxPrice,
                    enableDiscountFilter: vm.enableDiscountFilter,
                    currentMinDiscount: vm.minDiscount,
                    currentMaxDiscount: vm.maxDiscount,
                    onApply: (min, max, enable, minDisc, maxDisc) {
                      vm.filterByPrice(min, max);
                      vm.toggleDiscountFilter(enable);
                      if (enable) {
                        vm.filterByDiscountRange(minDisc, maxDisc);
                      }
                    },
                    onReset: vm.resetFilters,
                  );
                },
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Consumer<MallViewModel>(
                builder: (context, model, _) {
                  if (model.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (model.filteredProducts.isEmpty) {
                    return const Center(child: Text('No products found.'));
                  }

                  return BalancedMasonryGrid(
                    children: List.generate(model.filteredProducts.length, (index) {
                      final product = model.filteredProducts[index];
                      return ProductCard(
                        imageUrl: product.imageUrl,
                        title: product.title,
                        subtitle: product.subtitle,
                        price: 'RM ${product.price}',
                        discountPrice: product.discountPrice,
                        discountPercent: product.discountPercent,
                        isDiscount: product.discountPrice > 0,
                      );
                    }),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
