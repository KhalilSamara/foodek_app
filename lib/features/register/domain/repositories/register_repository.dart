import '../entity/register_entity.dart';

abstract class RegisterRepository {
  Future<List<RegisterEntity>> register();
}
