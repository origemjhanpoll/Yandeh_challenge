import 'package:equatable/equatable.dart';
import 'package:yandeh_challenge/feature/domain/entities/product.dart';

class Section extends Equatable {
  final String section;
  final String description;
  final List<Product> products;

  const Section({
    required this.section,
    required this.description,
    required this.products,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      section: json['section'],
      description: json['description'],
      products: (json['products'] as List<dynamic>)
          .map((product) => Product.fromJson(product))
          .toList(),
    );
  }

  Section copyWith({
    String? section,
    String? description,
    List<Product>? products,
  }) {
    return Section(
      section: section ?? this.section,
      description: description ?? this.description,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [
        section,
        description,
        products,
      ];
}
