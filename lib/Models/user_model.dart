import 'package:firebase_database/firebase_database.dart';

class UserModel {
  String? userID;
  String? email;
  String? firstName;
  String? lastName;
  String? role;
  String? pinCode;

  UserModel(
      {this.userID,
      this.email,
      this.firstName,
      this.lastName,
      this.role,
      this.pinCode});

  UserModel.fromSnapshot(DataSnapshot snapshot) {
    Map value = snapshot.value as Map;
    userID = snapshot.key;
    email = value['email'];
    firstName = value['firstName'];
    lastName = value['lastName'];
    role = value['role'];
    pinCode = value['pinCode'];
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userID: json['userID'],
        email: json['email'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        role: json['role'],
        pinCode: json['pinCode'],
      );

  Map<String, dynamic> toJson() => {
        'userID': userID,
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'role': role,
        'pinCode': pinCode,
      };
}
