class User {
  int? id;
  String? token;
  String? email;
  String? phone;
  bool? isLogin;

  // Biography
  String? name;
  String? birthPlace;
  String? birthDate;
  String? gender;
  String? address;

  User({
    this.id,
    this.token,
    this.email,
    this.phone,
    this.isLogin,

    // Biodata
    this.name,
    this.birthPlace,
    this.birthDate,
    this.gender,
    this.address,
  });

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
      id: json['id'],
      token: json['token'],
      email: json['email'],
      phone: json['phone'],
      isLogin: json['active'],

      // Biodata
      name: json['nama'],
      birthPlace: json['tempat_lahir'],
      birthDate: json['tanggal_lahir'],
      gender: json['gender'],
      address: json['alamat'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "token": token,
    "email": email,
    "phone": phone,
    "active": isLogin,

    // Biodata
    "nama": name,
    "tempat_lahir": birthPlace,
    "tanggal_lahir": birthDate,
    "gender": gender,
    "alamat": address,
  };
}
