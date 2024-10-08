import 'package:intl_phone_field/countries.dart';

String dialCodeToCountryCode(String dialCode) {
  print(dialCode);

  // Iterate through the list of countries provided by IntlPhoneField
  for (var country in countries) {
    if (country.dialCode == dialCode.replaceAll("+", "")) {
      print(country.code);
      return country.code;
    }
  }

  return "IN";
}
