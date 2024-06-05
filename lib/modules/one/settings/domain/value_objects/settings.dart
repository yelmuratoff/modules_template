import 'package:equatable/equatable.dart';

class Settings extends Equatable {
  const Settings({
    this.example,
  });

  final bool? example;

  @override
  List<Object?> get props => [example];

  Settings copyWith({
    bool? example,
  }) {
    return Settings(
      example: example ?? this.example,
    );
  }

  Settings mergeWith(Settings other) {
    return copyWith(
      example: other.example,
    );
  }
}
