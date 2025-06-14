import 'package:flutter/material.dart';
import 'package:garden_shop/model/index.dart';
import 'package:garden_shop/repositories/index.dart';

class DiscoverViewModel extends ChangeNotifier {
  final DiscoverRepository _repository;

  DiscoverViewModel(this._repository);

  List<MallProduct> _recommended = [];
  List<MallProduct> get recommended => _recommended;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 300));
    _recommended = _repository.getRecommendedProducts();

    _isLoading = false;
    notifyListeners();
  }

  MallProduct? getById(String id) {
    return _repository.getById(id);
  }
}
