import 'package:dio/dio.dart' as dio;
import 'package:sc_logger/sc_logger.dart';

import '../../../../../../../core/_shared/exceptions/app_exception.dart';
import '../../../../../../../core/network/gateway/domain/interface/i_gateway.dart';
import '../../domain/interface/i_phone_change_repo.dart';
import '../../domain/value_objects/response.dart';
import '../convert/response_convert.dart';

class PhoneChangeRepo implements IPhoneChangeRepo {
  PhoneChangeRepo({required this.gateway});

  final IGateway gateway;

  @override
  Future<String> confirm(
    String phone,
    String code,
  ) async {
    final response = await gateway.dio.post(
      '/user/settings/phone',
      data: {
        'phone': phone,
        'code': code,
      },
      options: dio.Options(
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    Log.c(response.verbose);
    final errors = AuthException.fromMap(response.data);
    if (errors.isNotEmpty) throw errors;
    return response.data['message'];
  }

  @override
  Future<Response> request(String phone) async {
    final response = await gateway.dio.put(
      '/user/settings/phone',
      data: {
        'phone': phone,
      },
    );
    Log.c(response.verbose);
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
