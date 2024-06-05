import 'package:equatable/equatable.dart';

import '../value_objects/env_type.dart';

class EnvTypeState extends Equatable {
  const EnvTypeState(this.envType);

  final EnvType envType;

  @override
  List<Object> get props => [envType];

  bool get isProduction => envType == EnvType.prod;
}
