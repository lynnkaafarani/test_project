class UserResponse {
  final UserProfile userProfile;
  final UserPrefs userPrefs;
  final List<UserMenu> userMenu;

  UserResponse({required this.userProfile, required this.userMenu, required this.userPrefs});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      userProfile: UserProfile.fromJson(json['userProfile']),
      userPrefs: UserPrefs.fromJson(json['userPrefs']),
      userMenu: (json['userMenu'] as List)
          .map((item) => UserMenu.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userProfile': userProfile.toJson(),
      'userPrefs': userPrefs.toJson(),
      'userMenu': userMenu.map((item) => item.toJson()).toList(),
    };
  }
}

class UserPrefs {
   String language;
   bool notification;

  UserPrefs({this.language = "", this.notification = false});

  factory UserPrefs.fromJson(Map<String, dynamic> json) {
    return UserPrefs(
      language: json['language'] as String? ?? "",
      notification: json['notification'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'language': language,
      'notification': notification,
    };
  }
}

class UserMenu {
  final String desc;
  final String id;

  UserMenu({this.desc = "", this.id = ""});

  factory UserMenu.fromJson(Map<String, dynamic> json) {
    return UserMenu(
      desc: json['desc'] as String? ?? "",
      id: json['id'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'desc': desc,
      'id': id,
    };
  }
}

class UserProfile {
   String fullName;
   String birthDate;
   PhoneInfo phoneInfo;
  List<String> address;
  final String email;
  final String gender;

  UserProfile({
    this.fullName = "",
    this.birthDate = "",
    required this.phoneInfo,
    required this.address,
    this.email = "",
    this.gender = "",
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      fullName: json['fullName'] as String? ?? "",
      birthDate: json['birthDate'] as String? ?? "",
      phoneInfo: PhoneInfo.fromJson(json['phoneInfo']),
      address: List<String>.from(json['address'] ?? []),
      email: json['email'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'birthDate': birthDate,
      'phoneInfo': phoneInfo.toJson(),
      'address': address,
      'email': email,
      'gender': gender,
    };
  }
}

class PhoneInfo {
   String code;
   String number;

  PhoneInfo({this.code = "", this.number = ""});

  factory PhoneInfo.fromJson(Map<String, dynamic> json) {
    return PhoneInfo(
      code: json['code'] as String? ?? "",
      number: json['number'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'number': number,
    };
  }
}