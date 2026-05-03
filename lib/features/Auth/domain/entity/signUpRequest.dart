class SignUpRequest {
  SignUpRequest({
    this.name,
    this.email,
    this.phone,
    this.password,
    this.passwordConfirmation,
  });

  String? name;
  String? email;
  String? phone;
  String? password;
  String? passwordConfirmation;

  SignUpRequest.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    passwordConfirmation = json['password_confirmation'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;
    map['password_confirmation'] = passwordConfirmation;
    return map;
  }
}