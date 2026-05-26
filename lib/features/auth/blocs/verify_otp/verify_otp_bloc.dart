// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lms/features/auth/blocs/verify_otp/verify_otp_event.dart';
// import 'package:lms/features/auth/models/verify_otp.dart';
// import 'package:lms/features/auth/repositories/auth_repository.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// part 'verify_otp_state.dart';

// class VerifyOtpBloc extends Bloc<OtpEvent, VerifyOtpState> {
//   final AuthRepository _authRepository = AuthRepository();

//   VerifyOtpBloc() : super(VerifyOtpInitial()) {

//     on<OtpEvent>((event, emit) async {

//       emit(VerifyOtpLoading());

//       final data = await _authRepository.verifyopt(
//         verify: VerifyOtpRequestModel(
//           email: event.email,
//           otp: event.otp,
//         ),
//       );

//       data.fold(
//         (l) {
//           emit(VerifyOtpFailure(msg: l));
//         },
//         (r) async {

//           // Uncomment if saving token
//           final pref = await SharedPreferences.getInstance();

//            await pref.setString(
//             "access_token",
//             r.token.access,
//           );

//           await pref.setString(
//             "refresh_token",
//             r.token.refresh,
//           );

//           emit(
//             VerifyOtpSuccess(
//               "OTP Verified Successfully",
//             ),
//           );
//         },
//       );
//     });
//   }
// }

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms/features/auth/models/verify_otp.dart';

import 'package:lms/features/auth/repositories/auth_repository.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  final AuthRepository _repo = AuthRepository();
  VerifyOtpBloc() : super(VerifyOtpInitial()) {
    on<VerifyOtpEvent>((event, emit) async {
      emit(VerifyOtpLoading());
      final result = await _repo.verifyOtp(email: event.email, otp: event.otp);

      result.fold(
        (l) => emit(VerifyOtpFailure(msg: l)),
        (r) => emit(VerifyOtpSuccess(r)),
      );
    });
  }
}
