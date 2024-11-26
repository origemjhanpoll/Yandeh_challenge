import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int id;
  final String name;
  final String sku;
  final String category;
  final String? unitType;
  final String package;
  final String ean;
  final int unitContent;
  final String unitMeasure;
  final int packageQuantity;
  final String price;

  const Product({
    required this.id,
    required this.name,
    required this.sku,
    required this.category,
    this.unitType,
    required this.package,
    required this.ean,
    required this.unitContent,
    required this.unitMeasure,
    required this.packageQuantity,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      sku: json['sku'],
      category: json['category'],
      unitType: json['unitType'] ?? '',
      package: json['package'] ?? '',
      ean: json['ean'] ?? '',
      unitContent: (json['unitContent'] as num).toInt(),
      unitMeasure: json['unitMessure'] ?? '',
      packageQuantity: (json['unitContent'] as num).toInt(),
      price: (json['price'] as String).isNotEmpty ? json['price'] : '0.0',
    );
  }

  Product copyWith({
    int? id,
    String? name,
    String? sku,
    String? category,
    String? unitType,
    String? package,
    String? ean,
    int? unitContent,
    String? unitMeasure,
    int? packageQuantity,
    String? price,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      sku: sku ?? this.sku,
      category: category ?? this.category,
      unitType: unitType ?? this.unitType,
      package: package ?? this.package,
      ean: ean ?? this.ean,
      unitContent: unitContent ?? this.unitContent,
      unitMeasure: unitMeasure ?? this.unitMeasure,
      packageQuantity: packageQuantity ?? this.packageQuantity,
      price: price ?? this.price,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        sku,
        category,
        unitType,
        package,
        ean,
        unitContent,
        unitMeasure,
        packageQuantity,
        price,
      ];
}
