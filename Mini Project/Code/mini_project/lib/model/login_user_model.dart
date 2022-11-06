class LoginUser {
  final String id;
  final String email;
  final String password;
  final String name;
  final String goal;

  LoginUser({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.goal,
  });

  factory LoginUser.fromJson(Map<String, dynamic> json) {
    return LoginUser(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      name: json['name'],
      goal: json['goal'],
    );
  }
}
