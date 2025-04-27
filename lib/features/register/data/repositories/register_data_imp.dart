import '../../domain/entity/register_entity.dart';
import '../../domain/repositories/register_repository.dart';
import '../data_source/register_data_source.dart';

class RegisterRepositoryImp extends RegisterRepository {
  RegisterRemoteDataSource postRemoteDataSource;

  RegisterRepositoryImp({required this.postRemoteDataSource});

  @override
  Future<List<RegisterEntity>> register() {
    return postRemoteDataSource.register();
  }
}
