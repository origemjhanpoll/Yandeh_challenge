import 'package:yandeh_challenge/features/home/domain/entities/product.dart';
import 'package:yandeh_challenge/features/home/domain/entities/section.dart';

Section get sectionSample => const Section(
      section: "Temperos",
      description: "Uma seleção completa para seus clientes.",
      products: [
        Product(
          id: 18992,
          name: "CEBOLA BENASSI BRANCA IMPORTADA 1 KG",
          sku: "1449654",
          category: "TEMPEROS E ERVAS FRESCAS",
          unitType: "",
          package: "SACO",
          ean: "04052176000490-015923",
          unitContent: 1,
          unitMessure: "KG",
          packageQuantity: 20,
          price: "2.57",
        ),
      ],
    );
