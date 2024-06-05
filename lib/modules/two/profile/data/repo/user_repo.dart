import 'package:dio/dio.dart';

import '../../../../../core/_shared/exceptions/app_exception.dart';
import '../../../../../core/network/gateway/domain/interface/i_gateway.dart';
import '../../domain/interface/i_user_repo.dart';
import '../convert/user_convert.dart';

class UserRepo implements IUserRepo {
  UserRepo({required this.gateway});

  final IGateway gateway;

  @override
  Future<String?> delete() async {
    final response = await gateway.dio.delete(
      '/user/settings/remove',
      options: Options(
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    final errors = AuthException.fromMap(response.data);
    if (errors.isNotEmpty) throw errors;
    return response.data['message'];
  }

  @override
  Future<User> read() async {
    final response = await gateway.dio.get('/auth/me/?delay=5000');
    try {
      return UserConvert.fromJson(response.data);
    } catch (error, stack) {
      Error.throwWithStackTrace(
        ConvertException(error.toString()),
        stack,
      );
    }
  }
}
