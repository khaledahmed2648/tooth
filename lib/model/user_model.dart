class User {
  final String? name;
  final String? phone;
  final String? uId;
  final String? age;
  final String? gender;
  final String? nationalId;
  final String? governorate;

  User({
    this.name = '',
    this.age = '',
    this.phone = '',
    this.uId = '',
    this.gender = '',
    this.nationalId = '',
    this.governorate = '',
  });
}

class UserModel extends User {
  UserModel({
    super.name,
    super.phone,
    super.age,
    super.governorate,
    super.nationalId,
    super.uId,
    super.gender,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      phone: json['phone'],
      uId: json['uId'],
      gender: json['gender'],
      nationalId: json['nationalId'],
      governorate: json['governorate'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'phone': phone,
      'uId': uId,
      'gender': gender,
      'nationalId': nationalId,
      'governorate': governorate,
    };
  }
}
