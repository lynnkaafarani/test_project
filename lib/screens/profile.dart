import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:test2/constants/color_constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl/intl.dart';

import 'login_page.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController adressController = TextEditingController();
  List<DateTime?> _dates = [DateTime.now()];
  PhoneNumber _phoneNumber = PhoneNumber(countryISOCode: "", countryCode: "", number: "");
  Country _country = Country(name: "Lebanon", flag: "LB", code: "LB", dialCode: "+961", nameTranslations: {}, minLength: 0, maxLength: 0);
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
                      "Username",
                      style: TextStyle(
                          color: mainTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    Text(
                      "name@mrad.lb",
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
                    child: IntlPhoneField(disableLengthCheck: true,
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
                      initialCountryCode: _country.code,
                    onCountryChanged: (country){
                      setState(() {
                        _country=country;
                      });
                    },
                      onChanged: (phone) {
                      setState(() {
                        _phoneNumber=phone;
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
                controller: adressController,
                style: TextStyle(
                  color: mainTextColor,
                ),
                decoration: InputDecoration(
                  label: Text("Adress"),
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
            child: GestureDetector(onTap: () async {
              List<DateTime?>? results =
              await showCalendarDatePicker2Dialog(
                context: context,
                config: CalendarDatePicker2WithActionButtonsConfig(
                    calendarType: CalendarDatePicker2Type.single),
                dialogSize: const Size(325, 400),
                value: _dates,
                borderRadius: BorderRadius.circular(15),
              );
              if(results!.isNotEmpty){
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
                    Text(
                      DateFormat("yyyy-MM-dd").format(_dates[0]!),style:TextStyle(color:mainTextColor)
                    ),
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
                    Icon(Icons.logout, color: Colors.white),
                    Text("Log Out", style: TextStyle(color: Colors.white)),
                  ]),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
