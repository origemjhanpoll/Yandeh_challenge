import 'package:flutter_test/flutter_test.dart';
import 'package:yandeh_challenge/features/home/domain/entities/product.dart';

import '../../../../load_json.dart';
import '../../../../sample/product_sample.dart';

void main() async {
  final mockJson = await loadJson('test/json/product.json');

  group('Product', () {
    test('should correctly create a Product from JSON', () {
      final result = Product.fromJson(mockJson);

      expect(result, productSample);
    });

    test('should create a modified copy using copyWith', () {
      final result = productSample.copyWith(
        name: 'Updated Product',
        price: '25.99',
      );

      expect(
          result,
          const Product(
            id: 18992,
            name: "Updated Product",
            sku: "1449654",
            category: "TEMPEROS E ERVAS FRESCAS",
            unitType: "",
            package: "SACO",
            ean: "04052176000490-015923",
            unitContent: 1,
            unitMessure: "KG",
            packageQuantity: 20,
            price: "25.99",
          ));
    });
  });
}
