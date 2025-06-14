// lib/providers/mall_provider.dart
import 'package:garden_shop/repositories/mall_repo.dart';
import 'package:garden_shop/viewmodels/mall_vm.dart';

final mallRepository = MallRepository();

final mallViewModel = MallViewModel(mallRepository);
