import 'package:garden_shop/data/mall_dummy_data.dart';
import 'package:garden_shop/model/index.dart';

class MallRepository {
  List<MallProduct> getAllProducts() {
    return mallDummyData;
  }

  MallProduct? getProductById(String id) {
    return mallDummyData.firstWhere(
      (product) => product.id == id,
      orElse: () => MallProduct.initial(),
    );
  }
}
