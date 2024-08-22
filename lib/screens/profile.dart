import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/constants/color_constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl/intl.dart';
import 'package:test2/constants/login-class.dart';
import 'package:test2/constants/other_constants.dart';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  List<DateTime?> _dates = [DateTime.now()];
  PhoneNumber _phoneNumber =
      PhoneNumber(countryISOCode: "", countryCode: "", number: "");
  Country _country = Country(
      name: "Lebanon",
      flag: "LB",
      code: "LB",
      dialCode: "+961",
      nameTranslations: {},
      minLength: 0,
      maxLength: 0);

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              // Use MainAxisAlignment.start to align the child to the start
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage('insta/avatar.png'),
                  width: 220,
                  height: 220,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    Text(
                      userResponse.userProfile.fullName,
                      style: TextStyle(
                          color: mainTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      userResponse.userProfile.email,
                      style: TextStyle(color: mainTextColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 38.0, left: 38),
            child: Divider(
              thickness: 2,
              color: mainTextColor,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: usernameController,
                style: TextStyle(
                  color: mainTextColor,
                ),
                decoration: InputDecoration(
                  label: Text("Name"),
                  labelStyle: TextStyle(color: mainTextColor),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: green)),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: green)),
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: IntlPhoneField(
                      controller: phoneController,
                      disableLengthCheck: true,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(color: mainTextColor),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: green),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: green),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: green),
                        ),
                      ),
                      initialCountryCode: dialCodeToCountryCode(
                          userResponse.userProfile.phoneInfo.code),
                      onCountryChanged: (country) {
                        setState(() {
                          _country = country;
                        });
                      },
                      onChanged: (phone) {
                        setState(() {
                          _phoneNumber = phone;
                        });
                        print(phone.completeNumber);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                controller: addressController,
                style: TextStyle(
                  color: mainTextColor,
                ),
                decoration: InputDecoration(
                  label: Text("Address"),
                  labelStyle: TextStyle(color: mainTextColor),
                  enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: green)),
                  focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: green)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: GestureDetector(
              onTap: () async {
                List<DateTime?>? results = await showCalendarDatePicker2Dialog(
                  context: context,
                  config: CalendarDatePicker2WithActionButtonsConfig(
                      calendarType: CalendarDatePicker2Type.single),
                  dialogSize: const Size(325, 400),
                  value: _dates,
                  borderRadius: BorderRadius.circular(15),
                );
                if (results!.isNotEmpty) {
                  setState(() {
                    _dates = results;
                  });
                }

                print(results);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: green,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Icon(Icons.cake, color: mainTextColor),
                    ),
                    Text(DateFormat("yyyy-MM-dd").format(_dates[0]!),
                        style: TextStyle(color: mainTextColor)),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 188,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: mainTextColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: Row(children: [
                    Icon(Icons.update, color: Colors.white),
                    Center(
                      child: Text(
                        "Update",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ]),
                  onPressed: () {
                    userResponse.userProfile.fullName = usernameController.text;
                    userResponse.userProfile.phoneInfo.number =
                        phoneController.text;
                    userResponse.userProfile.address[0] =
                        addressController.text;
                    userResponse.userProfile.phoneInfo.code = _country.dialCode;
                    setState(() {});
                    save(userResponse);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  void init() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userPrefsJson = prefs.getString('userResponse');

    Map<String, dynamic> userPrefsMap = json.decode(userPrefsJson!);

    print(userPrefsMap);
    final UserResponse userResponse = UserResponse.fromJson(userPrefsMap);

    usernameController.text = userResponse.userProfile.fullName;
    print(usernameController.text);
    addressController.text = userResponse.userProfile.address[0];
    phoneController.text = userResponse.userProfile.phoneInfo.number;
    final List<String> dateSplit =
        userResponse.userProfile.birthDate.split('-');
    _dates[0] = DateTime(
      int.parse(dateSplit[0]),
      int.parse(dateSplit[1]),
      int.parse(
        dateSplit[2],
      ),
    );
    setState(() {});
  }

  void save(UserResponse userResponse) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userPrefsJson = json.encode(userResponse.toJson());
    await prefs.setString('userResponse', userPrefsJson);
  }
}
