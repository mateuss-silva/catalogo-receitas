import 'package:flutter_test/flutter_test.dart';
import 'package:food_challenge_20210610/app/modules/home/home_module.dart';
import 'package:food_challenge_20210610/app/modules/product/product_module.dart';
import 'package:modular_test/modular_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() {
    initModule(HomeModule());
    initModule(ProductModule());
  });
}
