import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    this.id,
    this.email,
    this.phone,
    this.firstName,
    this.lastName,
    this.image,
  });

  final String? email;
  final String? firstName;
  final int? id;
  final String? image;
  final String? lastName;
  final String? phone;

  @override
  List<Object?> get props {
    return [
      id,
      email,
      phone,
      firstName,
      lastName,
      image,
    ];
  }

  String? get fullName {
    final output = <String>[];
    if (firstName != null) output.add(firstName!);
    if (lastName != null) output.add(lastName!);
    if (output.isEmpty) return null;
    return output.join(' ');
  }
}
