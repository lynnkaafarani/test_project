class JsnFct{
  final int userId;
  final String name;
  final String password;
  final String address ;
  final String phoneCode;
  final String phoneNumber;
  final String phonePrefix;
  final String birthdate;
  final String email;

  JsnFct(
      {required this.userId,
      required this.name,
      required this.password,
        required this.address,
        required this.phoneCode,
        required this.phoneNumber,
        required this.phonePrefix,
        required this.birthdate,
        required this.email});
  factory JsnFct.fromJson(Map<String, dynamic> json) {
    return JsnFct(
     userId:  json['userId'] as int,
     name:  json['name'] as String,
     password:  json['password'] as String,
     address:  json['address'] as String,
     phoneCode:  json['phoneCode'] as String,
    phoneNumber:   json['phoneNumber'] as String,
    phonePrefix:   json['phonePrefix'] as String,
    birthdate:   json['birthdate'] as String,
     email:  json['email'] as String,
    );
  }
  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'password': password,
      'address': address,
      'phoneCode': phoneCode,
      'phoneNumber': phoneNumber,
      'phonePrefix': phonePrefix,
      'birthdate': birthdate,
      'email': email,
    };
  }

}
