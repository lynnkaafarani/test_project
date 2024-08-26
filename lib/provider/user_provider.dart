import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test2/constants/login-class.dart';
import 'package:test2/screens/abous_us.dart';
import 'package:test2/screens/profile.dart';
import 'package:test2/screens/settings.dart';

class UserProvider extends ChangeNotifier{
    UserResponse userResponse = UserResponse(
    userPrefs: UserPrefs(
      language: '',
      notification: false,
    ),
    userProfile: UserProfile(
      fullName: '',
      birthDate: '',
      phoneInfo: PhoneInfo(code: '', number: ''),
      email: '',
      gender: '',
      address: [],
    ),
    userMenu: [],
  );
  List<Widget> screens=[];
  List<IconData> icon=[];

  UserResponse get userResponseGetter => userResponse;
  List<Widget> get screensGetter => screens;
  List<IconData> get iconGetter => icon;

  void init() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final data = sp.getString("userResponse") ?? "{}";
    final decodedData = jsonDecode(data);
    userResponse = UserResponse.fromJson(decodedData);
    print(userResponse.userProfile.email);
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
    notifyListeners();
  }

  void updateData(UserResponse data){
    userResponse=data;
    print("test 2 ${userResponse.userProfile.fullName}");
    print("test 3 ${data.userProfile.fullName}");
    notifyListeners();
  }

}