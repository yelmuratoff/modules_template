import '../../../../../../core/_shared/exceptions/app_exception.dart';
import '../../../../../../core/network/gateway/domain/interface/i_gateway.dart';
import '../../domain/interface/i_recipes_repo.dart';
import '../convert/recipes_req_convert.dart';
import '../convert/recipes_resp_convert.dart';

class RecipesRepo implements IRecipesRepo {
  RecipesRepo(this.gateway);

  final IGateway gateway;

  @override
  Future<RecipesResp> read(RecipesReq request) async {
    final resp = await gateway.dio.get(
      '/recipes',
      queryParameters: request.toJson(),
    );
    final error = BackendException.fromJson(resp.data);
    if (error.messages.isNotEmpty) throw error;
    try {
      return RecipesRespConvert.fromJson(
        resp.data,
        request.pageSize,
      );
    } catch (error, stack) {
      Error.throwWithStackTrace(
        ConvertException(error.toString()),
        stack,
      );
    }
  }
}
