import 'package:flutter/material.dart';

void showPriceFilterSheet(
  BuildContext context, {
  required double currentMin,
  required double currentMax,
  required bool enableDiscountFilter,
  required double currentMinDiscount,
  required double currentMaxDiscount,
  required void Function(
    double minPrice,
    double maxPrice,
    bool enableDiscount,
    double minDiscount,
    double maxDiscount,
  )
  onApply,
  required VoidCallback onReset,
}) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      double minPrice = currentMin;
      double maxPrice = currentMax;
      bool discountEnabled = enableDiscountFilter;
      double minDiscount = currentMinDiscount;
      double maxDiscount = currentMaxDiscount;

      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Filter by Price',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  RangeSlider(
                    values: RangeValues(minPrice, maxPrice),
                    min: 0,
                    max: 1000,
                    divisions: 100,
                    labels: RangeLabels('RM ${minPrice.toInt()}', 'RM ${maxPrice.toInt()}'),
                    onChanged: (range) {
                      setState(() {
                        minPrice = range.start;
                        maxPrice = range.end;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Min: RM ${minPrice.toInt()}'),
                      Text('Max: RM ${maxPrice.toInt()}'),
                    ],
                  ),
                  const SizedBox(height: 32),
                  SwitchListTile(
                    title: const Text('Enable Discount Filter'),
                    value: discountEnabled,
                    onChanged: (value) {
                      setState(() {
                        discountEnabled = value;
                      });
                    },
                  ),
                  if (discountEnabled) ...[
                    const SizedBox(height: 8),
                    const Text('Discount Range (%)'),
                    RangeSlider(
                      values: RangeValues(minDiscount, maxDiscount),
                      min: 0,
                      max: 100,
                      divisions: 20,
                      labels: RangeLabels('${minDiscount.toInt()}%', '${maxDiscount.toInt()}%'),
                      onChanged: (range) {
                        setState(() {
                          minDiscount = range.start;
                          maxDiscount = range.end;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Min: ${minDiscount.toInt()}%'),
                        Text('Max: ${maxDiscount.toInt()}%'),
                      ],
                    ),
                  ],
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            onReset();
                          },
                          icon: const Icon(Icons.refresh),
                          label: const Text('Reset'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            onApply(minPrice, maxPrice, discountEnabled, minDiscount, maxDiscount);
                          },
                          icon: const Icon(Icons.check),
                          label: const Text('Apply'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
