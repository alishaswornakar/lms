// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lms/core/models/verify_otp.dart';

// import 'package:lms/features/auth/repositories/auth_repository.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// part 'otp_event.dart';
// part 'otp_state.dart';

// class OtpBloc extends Bloc<OtpEvent, OtpState> {
//   final AuthRepository _authRepository = AuthRepository();
//   OtpBloc() : super(OtpInitial()) {
//     on<OtpEvent>((event, emit) async {
//       emit(OtpLoading());

//       final data = await _authRepository.verifyopt(
//         verify: event.otpRequestModel,
//       );

//       data.fold((l) async => emit(OtpFailure(msg: l)), (r) {
//         // final pref = await SharedPreferences.getInstance();

//         // await pref.setString("access_token", r.token.access);

//          //await pref.setString("refresh_token", r.token.refresh);
// //
//         emit(OtpLoaded());
//       });
//     });
//   }
// }
