
class LoginFormModel {
 
  final String email;
  final String password;
  LoginFormModel({
   
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      
      'email': email,
      'password': password,
    };
  }
}

    
