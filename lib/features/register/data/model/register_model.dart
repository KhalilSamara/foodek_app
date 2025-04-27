import '../../domain/entity/register_entity.dart';

class RegisterModel extends RegisterEntity {
  RegisterModel({
    required super.name,
    required super.email,
    required super.birth_date,
    required super.phone_number,
    required super.password,
  });

  factory RegisterModel.fromJson({required Map<String, dynamic> json}) {
    return RegisterModel(
      name: json['name'],
      email: json['email'],
      birth_date: json['birth_date'],
      phone_number: json['phone_number'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['birth_date'] = birth_date;
    data['phone_number'] = phone_number;
    data['password'] = password;
    return data;
  }
}
