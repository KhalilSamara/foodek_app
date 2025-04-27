import '../../../../core/network/api_client.dart';
import '../../domain/entity/register_entity.dart';
import '../model/register_model.dart';

abstract class RegisterDataSource {
  Future<List<RegisterEntity>> register();
}

class RegisterRemoteDataSource extends RegisterDataSource {
  @override
  Future<List<RegisterEntity>> register() async {
    final response = await ApiClient.getDataList(
      endpoint: "posts",
      fromJsonT: (data) => RegisterModel.fromJson(json: data),
    );
    return response;
  }
}
