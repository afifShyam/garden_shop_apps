import 'package:garden_shop/repositories/index.dart';
import 'package:garden_shop/viewmodels/index.dart';

final mallRepository = MallRepository();
final discoverRepository = DiscoverRepository();

final mallViewModel = MallViewModel(mallRepository);
final discoverViewModel = DiscoverViewModel(discoverRepository);
