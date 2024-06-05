import 'package:sc_picker_and_gallery/_shared/dto/sc_filebox.dart';

import '../../domain/value_objects/product.dart';

extension ProductConvert on Product {
  static Product? fromJson(dynamic json) {
    if (json == null) return null;
    return Product(
      id: json['id'],
      title: json['title'],
      brand: json['brand'],
      stock: json['stock'],
      price: json['price'],
      category: json['category'],
      images: (json['images'] as List?)
          ?.map(
            (e) => ScFilebox(
              uri: Uri.tryParse(e),
            ),
          )
          .toList(),
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'brand': brand,
      'stock': stock,
      'price': price,
      'category': category,
      'thumbnail': thumbnail,
      'images': images,
    };
  }
}

abstract class ProductsListConvert {
  static List<Product>? from(List? list) {
    if (list == null) return null;
    return list.map<Product?>(ProductConvert.fromJson).whereType<Product>().toList();
  }
}
