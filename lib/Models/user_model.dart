class UserModel {
  String? userID;
  String? email;
  String? password;
  String? employeeName;
  String? displayName;
  String? initials;
  String? pinNumber;
  String? insuranceCode;
  String? logonName;
  String? country;
  String? phoneNumber;
  String? postCode;
  String? address;
  String? role;

  UserModel({
    this.userID,
    this.email,
    this.password,
    this.employeeName,
    this.displayName,
    this.initials,
    this.pinNumber,
    this.insuranceCode,
    this.logonName,
    this.country,
    this.phoneNumber,
    this.postCode,
    this.address,
    this.role,
  });

  UserModel.fromSnapshot(snapshot) {
    Map value = snapshot.data() as Map;
    userID = snapshot.id;
    email = value['email'];
    password = value['password'];
    employeeName = value['employeeName'];
    displayName = value['displayName'];
    initials = value['initials'];
    pinNumber = value['pinNumber'];
    insuranceCode = value['insuranceCode'];
    logonName = value['logonName'];
    country = value['country'];
    phoneNumber = value['phoneNumber'];
    postCode = value['postCode'];
    address = value['address'];
    role = value['role'];
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userID: json['userID'],
        email: json['email'],
        password: json['password'],
        employeeName: json['employeeName'],
        displayName: json['displayName'],
        initials: json['initials'],
        pinNumber: json['pinNumber'],
        insuranceCode: json['insuranceCode'],
        logonName: json['logonName'],
        country: json['country'],
        phoneNumber: json['phoneNumber'],
        postCode: json['postCode'],
        address: json['address'],
        role: json['role'],
      );

  Map<String, dynamic> toJson() => {
        'userID': userID,
        'email': email,
        "password": password,
        "employeeName": employeeName,
        "displayName": displayName,
        "initials": initials,
        "pinNumber": pinNumber,
        "insuranceCode": insuranceCode,
        "logonName": logonName,
        "country": country,
        "phoneNumber": phoneNumber,
        "postCode": postCode,
        "address": address,
        'role': role,
      };
}
