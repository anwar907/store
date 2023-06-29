class LoginModels {
  final String? token;

  LoginModels({this.token});

  factory LoginModels.fromJson(Map<String, dynamic> json) =>
      LoginModels(token: json['token']);

  Map<String, dynamic> toJson() => {'token': token};
}
