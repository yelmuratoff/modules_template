import 'package:equatable/equatable.dart';

import '../../../../../../shared/value_objects/file_box.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    this.title,
    this.brand,
    this.stock,
    this.price,
    this.thumbnail,
    this.category,
    this.images = const [],
  });

  final String? brand;
  final String? category;
  final num id;
  final List<Filebox>? images;
  final num? price;
  final num? stock;
  final String? thumbnail;
  final String? title;

  @override
  List<Object?> get props {
    return [
      brand,
      id,
      category,
      images,
      stock,
      title,
      price,
      thumbnail,
    ];
  }
}
