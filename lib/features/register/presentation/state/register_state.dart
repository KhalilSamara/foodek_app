import '../../domain/entity/register_entity.dart';

abstract class RegisterState {}

class RegisterStateLoading extends RegisterState {}

class RegisterStateLoaded extends RegisterState {}

class RegisterStateError extends RegisterState {
  String message;

  RegisterStateError(this.message);
}

class RegisterStateIntl extends RegisterState {}
