import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/register_model.dart';
import '../../domain/use_case/register_use_case.dart';
import '../state/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;

  RegisterCubit({required this.registerUseCase}) : super(RegisterStateIntl());

  register({required RegisterModel registerModel}) {
    emit(RegisterStateLoading());

    registerUseCase
        .call(MapParams(map: registerModel.toJson()))
        .then(
          (value) {
            emit(RegisterStateLoaded());
          },
          onError: (error) {
            emit(RegisterStateError(error.toString()));
          },
        );
  }
}
