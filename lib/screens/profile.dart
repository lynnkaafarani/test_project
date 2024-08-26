import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test2/constants/color_constants.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl/intl.dart';
import 'package:test2/constants/other_constants.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:test2/provider/user_provider.dart';
import 'package:test2/widgets/provider.dart';

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
  String newdialcode = "";

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ProfileProvider(),
        child: Consumer<UserProvider>(builder: (context, userProvider, _) {
          return SingleChildScrollView(
              child: Consumer<ProfileProvider>(builder: (context, provider, _) {
            return Column(
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
                            userProvider.userResponse.userProfile.fullName,
                            style: TextStyle(
                                color: mainTextColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            userProvider.userResponse.userProfile.email,
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
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green)),
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
                                userProvider
                                    .userResponse.userProfile.phoneInfo.code),
                            onCountryChanged: (country) {
                              provider.changeCountry(country, country.code);
                              newdialcode = country.dialCode;
                            },
                            onChanged: (phone) {
                              provider.changePhone(phone);
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
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: green)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: GestureDetector(
                    onTap: () async {
                      List<DateTime?>? results =
                          await showCalendarDatePicker2Dialog(
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
                          provider.updateProfile(
                              usernameController.text,
                              addressController.text,
                              phoneController.text,
                              newdialcode,
                              DateFormat("yyyy-MM-dd").format(_dates[0]!),
                              context);
                        }),
                  ),
                ),
              ],
            );
          }));
        }));
  }

  void init() async {
    usernameController.text = Provider.of<UserProvider>(context, listen: false)
        .userResponse
        .userProfile
        .fullName;
    print(usernameController.text);
    addressController.text = Provider.of<UserProvider>(context, listen: false)
        .userResponse
        .userProfile
        .address[0];
    phoneController.text = Provider.of<UserProvider>(context, listen: false)
        .userResponse
        .userProfile
        .phoneInfo
        .number;
    final List<String> dateSplit =
        Provider.of<UserProvider>(context, listen: false)
            .userResponse
            .userProfile
            .birthDate
            .split('-');
    _dates[0] = DateTime(
      int.parse(dateSplit[0]),
      int.parse(dateSplit[1]),
      int.parse(
        dateSplit[2],
      ),
    );
    newdialcode = dialCodeToCountryCode(
      Provider.of<UserProvider>(context, listen: false)
          .userResponse
          .userProfile
          .phoneInfo
          .code,
    );
    setState(() {});
  }
}
