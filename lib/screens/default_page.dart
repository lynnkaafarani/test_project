import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/constants/color_constants.dart';
import 'package:test2/constants/login-class.dart';
import 'package:test2/screens/abous_us.dart';
import 'package:test2/screens/profile.dart';
import 'package:test2/screens/settings.dart';
import 'package:test2/widgets/drawer_item.dart';

import '../constants/other_constants.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _State();
}

///
class _State extends State<DefaultPage> {
  List<Widget> screens = [
  ];

List<IconData> icon=[];
  ValueNotifier<int> selectedPage = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: selectedPage,
        builder: (context, val, _) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: mainTextColor,
              title: Text(
                userResponse.userMenu[selectedPage.value].desc,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                Container(
                  color: mainTextColor,
                  child: Image(
                    image: AssetImage('insta/mrad.png'),
                    width: 85,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 24)
              ],
            ),
            drawer: Drawer(
                elevation: double.minPositive,
                backgroundColor: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      width: 700,
                    ),
                    Image(
                      image: AssetImage('insta/avatar.png'),
                      width: 240,
                      height: 140,
                    ),
                    Text(
                      userResponse.userProfile.fullName,
                      style: TextStyle(
                          color: mainTextColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 34, right: 34, bottom: 24),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: userResponse.userMenu.length,
                          itemBuilder: (context, index) {
                            return DrawerItem(
                                title: userResponse.userMenu[index].desc,
                                icon: icon[index],
                                selectedItem: selectedPage,
                                currentIndex: index);
                          }),
                    ),
                  ],
                )),
            body: screens[selectedPage.value],
          );
        });
  }

  void init() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final data = sp.getString("userResponse") ?? "{}";
    final decodedData = jsonDecode(data);
    userResponse = UserResponse.fromJson(decodedData);

    for(UserMenu menu in userResponse.userMenu){
      if(menu.id=="1"){
        screens.add(ProfilePage());
        icon.add(Icons.person);

      }else if(menu.id=="2"){
        screens.add(AbousUs());
        icon.add(Icons.home);
      }else if(menu.id=="3"){
        screens.add(SettingsPage());
        icon.add(Icons.settings);
      }
    }
    setState(() {

    });
  }
}
