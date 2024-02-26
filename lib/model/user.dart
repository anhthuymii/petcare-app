class User {
  final String? user_id;
  final String? username;
  final String? password;
  final String? hoten;
  final String? email;
  final String? date;
  final String? gioitinh;

  User({
    this.user_id,
    this.username,
    this.password,
    this.hoten,
    this.email,
    this.date,
    this.gioitinh,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      user_id: json['user_id'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      hoten: json['hoten'] as String?,
      email: json['email'] as String?,
      date: json['date'] as String?,
      gioitinh: json['gioitinh'] as String?,
    );
  }

  Map<String, dynamic> toJsonAdd() {
    return {
      "username": username ?? "",
      "email": email ?? "",
      "password": password ?? "",
      "hoten": hoten ?? "",
      "gioitinh": gioitinh ?? "",
      "date": date ?? "",
    };
  }

  Map<String, dynamic> toJsonUpdate() {
    return {
      "user_id": user_id ?? "",
      "username": username ?? "",
      "email": email ?? "",
      "password": password ?? "",
      "hoten": hoten ?? "",
      "gioitinh": gioitinh ?? "",
      "date": date ?? "",
    };
  }
}
