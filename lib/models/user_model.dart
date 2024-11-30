//import 'dart:ffi';

class UserModel {
  final String id;
  final String fullname;
  final String? email;
  final String password;
  final String division;
  final String? orgname;
  final String phoneNumber;
  final String birthDate;

  UserModel({
    required this.id,
    required this.email,
    required this.fullname,
    required this.password,
    required this.orgname,
    required this.division,
    required this.phoneNumber,
    required this.birthDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullname': fullname,
      'email': email,
      'password': password,
      'orgname': orgname,
      'division': division,
      'birthDate': birthDate,
      'phone': phoneNumber,
      
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        fullname: json['fullname'],
        email: json['email'],
        orgname: json['orgname'],
        division: json['division'],
        phoneNumber: json['phone'],
        birthDate: json['birthDate'], 
        password: json['password']);
  }
}
