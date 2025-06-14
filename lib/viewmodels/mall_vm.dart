import 'package:flutter/foundation.dart';
import 'package:garden_shop/model/index.dart';
import 'package:garden_shop/repositories/index.dart';

class MallViewModel extends ChangeNotifier {
  final MallRepository _repository;

  MallViewModel(this._repository);

  List<MallProduct> _products = [];
  List<MallProduct> get products => _products;

  List<MallProduct> _filteredProducts = [];
  List<MallProduct> get filteredProducts => _filteredProducts;

  double minPrice = 0;
  double maxPrice = 1000;

  bool enableDiscountFilter = false;
  double minDiscount = 0;
  double maxDiscount = 100;

  String _searchQuery = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 300));
    _products = _repository.getAllProducts();
    _filteredProducts = List.from(_products);

    _isLoading = false;
    notifyListeners();
  }

  void searchProducts(String query) {
    _searchQuery = query;
    _applyFilters();
  }

  void filterByPrice(double min, double max) {
    minPrice = min;
    maxPrice = max;
    _applyFilters();
  }

  void toggleDiscountFilter(bool enabled) {
    enableDiscountFilter = enabled;
    _applyFilters();
  }

  void filterByDiscountRange(double min, double max) {
    minDiscount = min;
    maxDiscount = max;
    _applyFilters();
  }

  void resetFilters() {
    minPrice = 0;
    maxPrice = 1000;
    enableDiscountFilter = false;
    minDiscount = 0;
    maxDiscount = 100;
    _searchQuery = '';
    _filteredProducts = List.from(_products);
    notifyListeners();
  }

  void _applyFilters() {
    _filteredProducts =
        _products.where((product) {
          final price = product.price;
          final matchesPrice = price >= minPrice && price <= maxPrice;

          final title = product.title.toLowerCase();
          final matchesSearch = title.contains(_searchQuery.toLowerCase());

          bool matchesDiscount = true;
          if (enableDiscountFilter) {
            final discount = product.discountPercent;
            matchesDiscount = discount >= minDiscount && discount <= maxDiscount;
          }

          return matchesPrice && matchesSearch && matchesDiscount;
        }).toList();

    notifyListeners();
  }

  MallProduct? getProductById(String id) {
    return _repository.getProductById(id);
  }
}
