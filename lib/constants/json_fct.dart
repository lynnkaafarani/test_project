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

  JsnFct(this.userId, this.name, this.password, this.address, this.phoneCode, this.phoneNumber, this.phonePrefix, this.birthdate, this.email);
  factory JsnFct.fromJson(Map<String, dynamic> json) {
    return JsnFct(
      json['userId'] as int,
      json['name'] as String,
      json['password'] as String,
      json['address'] as String,
      json['phoneCode'] as String,
      json['phoneNumber'] as String,
      json['phonePrefix'] as String,
      json['birthdate'] as String,
      json['email'] as String,
    );
  }
}
