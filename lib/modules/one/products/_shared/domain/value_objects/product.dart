import 'package:equatable/equatable.dart';
import 'package:sc_picker_and_gallery/_shared/dto/sc_filebox.dart';

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
  final List<ScFilebox>? images;
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
