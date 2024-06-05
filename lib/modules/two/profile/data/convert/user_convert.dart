import '../../domain/value_objects/user.dart';

extension UserConvert on User {
  static User fromJson(dynamic json) {
    return User(
      id: json['id'],
      email: json['email'],
      phone: json['phone'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      image: json['image'],
    );
  }
}
