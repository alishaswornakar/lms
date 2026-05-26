import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/core/data/storage/token_service.dart';

part 'token_state.dart';

class TokenCubit extends Cubit<TokenState> {
  TokenCubit() : super(TokenInitial());

  void logout()async{
    await TokenService.instance.clearToken();
    emit(TokenUnAuthenticated());
  }

  void checkLoginStatus() async {
    emit(TokenLoading());
    // await Future.delayed(Duration(seconds: 3));
    try {
      final data = await TokenService.instance.getAccessToken();

      if (data == null) {
        emit(TokenUnAuthenticated());
      } else {
        emit(TokenAuthenticated());
      }
    } catch (e) {
      emit(TokenUnAuthenticated());
    }
  }
}
