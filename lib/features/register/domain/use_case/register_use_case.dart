import '../../../../core/use_case/use_case.dart';
import '../entity/register_entity.dart';
import '../repositories/register_repository.dart';

class RegisterUseCase implements UseCase<List<RegisterEntity>, NoParams> {
  final RegisterRepository repository;

  RegisterUseCase({required this.repository});

  @override
  Future<List<RegisterEntity>> call(NoParams params) {
    return repository.register();
  }
}
