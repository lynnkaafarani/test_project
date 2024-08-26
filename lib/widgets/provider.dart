import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:test2/constants/login-class.dart';
import 'package:test2/provider/user_provider.dart';

class ProfileProvider extends ChangeNotifier {
  String userName = '';
  String address = '';
  PhoneNumber phoneNumber =
      PhoneNumber(countryISOCode: "", countryCode: "", number: "");
  Country country = Country(
      name: "Lebanon",
      flag: "LB",
      code: "LB",
      dialCode: "+961",
      nameTranslations: {},
      minLength: 0,
      maxLength: 0);
  String _birthDate = DateFormat("yyyy-MM-dd").format(DateTime.now());

  String get userNameGetter => userName;

  String get addressGetter => address;

  PhoneNumber get phoneNumberGetter => phoneNumber;

  Country get countryGetter => country;

  String get birthDateGetter => _birthDate;

  // Initialize profile data
  Future<void> initProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userPrefsJson = prefs.getString('userResponse');

    Map<String, dynamic> userPrefsMap = json.decode(userPrefsJson!);
    // Initialize user profile data here
    userName = userPrefsMap['userProfile']['fullName'];
    address = userPrefsMap['userProfile']['address'][0];
    phoneNumber = PhoneNumber(
      countryISOCode: userPrefsMap['userProfile']['phoneInfo']['code'],
      number: userPrefsMap['userProfile']['phoneInfo']['number'],
      countryCode: dialCodeToCountryCode(
          userPrefsMap['userProfile']['phoneInfo']['number']),
    );
    country = Country(
      dialCode: userPrefsMap['userProfile']['phoneInfo']['code'],
      name: '',
      code: dialCodeToCountryCode(
          userPrefsMap['userProfile']['phoneInfo']['code']),
      flag: '',
      nameTranslations: {},
      minLength: 0,
      maxLength: 0, // Adjust according to your data
    );
    _birthDate = DateFormat("yyyy-MM-dd")
        .format(DateTime.parse(userPrefsMap['userProfile']['birthDate']));
    notifyListeners();
  }

  // Update profile data
  void updateProfile(String name, String addressVal, String phoneNumberVal,
      String countryVal, String birthDate, context) async {
    userName = name;
    address = addressVal;
    phoneNumber.number = phoneNumberVal;
    phoneNumber.countryCode = dialCodeToCountryCode(countryVal);
    _birthDate = birthDate;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final UserResponse oldData =
        Provider.of<UserProvider>(context, listen: false).userResponse;

    print("test name ${oldData.userProfile.fullName}");
    final UserResponse userResponse = UserResponse(
        userProfile: UserProfile(
            gender: oldData.userProfile.gender,
            birthDate: birthDate,
            phoneInfo:
                PhoneInfo(code: country.dialCode, number: phoneNumberVal),
            address: [addressVal],
            fullName: name,
            email: oldData.userProfile.email),
        userMenu: oldData.userMenu,
        userPrefs: oldData.userPrefs);
    String userPrefsJson = json.encode(userResponse);

    await prefs.setString('userResponse', userPrefsJson);
    print("updated ${userResponse.userProfile.email}");
    Provider.of<UserProvider>(context, listen: false).updateData(userResponse);

    notifyListeners();
  }

  void changeCountry(Country countryVal, String code) {
    country = countryVal;
    code = dialCodeToCountryCode(country.dialCode);
    notifyListeners();
  }

  void changePhone(PhoneNumber phone) {
    phoneNumber = phone;
    notifyListeners();
  }

  String dialCodeToCountryCode(String dialCode) {
    print(dialCode);

    notifyListeners();
    // Iterate through the list of countries provided by IntlPhoneField
    for (var country in countries) {
      if (country.dialCode == dialCode.replaceAll("+", "")) {
        print(country.code);
        return country.code;
      }
    }

    return "LB";
  }
}
