import 'package:equatable/equatable.dart';

class Quote extends Equatable {
  const Quote({
    this.author,
    this.id,
    this.quote,
  });

  final String? author;
  final int? id;
  final String? quote;

  @override
  List<Object?> get props => [author, id, quote];
}
