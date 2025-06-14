import 'package:garden_shop/data/index.dart';
import 'package:garden_shop/model/index.dart';

class DiscoverRepository {
  List<MallProduct> getRecommendedProducts() {
    return discoverDummyData;
  }

  MallProduct? getById(String id) {
    return discoverDummyData.firstWhere(
      (p) => p.id == id,
      orElse: () => throw Exception('Product not found'),
    );
  }
}
