import 'package:dio/dio.dart' as dio;

import '../../../../../../../core/_shared/exceptions/app_exception.dart';
import '../../../../../../../core/network/gateway/domain/interface/i_gateway.dart';
import '../../domain/interface/i_email_change_repo.dart';
import '../../domain/value_objects/response.dart';
import '../convert/response_convert.dart';

class EmailChangeRepo implements IEmailChangeRepo {
  EmailChangeRepo({required this.gateway});

  final IGateway gateway;

  @override
  Future<String> confirm(
    String email,
    String code,
  ) async {
    final response = await gateway.dio.post(
      '/user/settings/email',
      data: {
        'code': code,
        'email': email,
      },
      options: dio.Options(
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    final errors = AuthException.fromMap(response.data);
    if (errors.isNotEmpty) throw errors;
    return response.data['message'];
  }

  @override
  Future<Response> request(String email) async {
    final response = await gateway.dio.put(
      '/user/settings/email',
      data: {
        'email': email,
      },
    );

    final errors = AuthException.fromMap(response.data);
    if (errors.isNotEmpty) throw errors;
    try {
      return ResponseConvert.fromJson(response.data);
    } catch (error, stack) {
      Error.throwWithStackTrace(
        ConvertException(error.toString()),
        stack,
      );
    }
  }
}
