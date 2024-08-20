import 'package:flutter/material.dart';
import 'package:test2/constants/color_constants.dart';
import 'package:test2/screens/abous_us.dart';
import 'package:test2/screens/profile.dart';
import 'package:test2/screens/settings.dart';
import 'package:test2/widgets/drawer_item.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _State();
}

class _State extends State<DefaultPage> {
  List<Widget> screens = [
    AbousUs(),
    ProfilePage(),
    SettingsPage(),
  ];
  List<String> titles = [
    "Home",
    "Profile",
    "Settings",
  ];
  ValueNotifier<int> selectedPage = ValueNotifier(0);

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
                titles[selectedPage.value],
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
                SizedBox(width:24)
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
                    Text("Username",style: TextStyle(color: mainTextColor,fontWeight: FontWeight.bold,fontSize: 24),),
                    SizedBox(width: 24,),
                    Padding(
                      padding: const EdgeInsets.only(left: 34,right: 34, bottom: 24),
                      child: Divider(thickness:1,),
                    ),
                    DrawerItem(
                      icon: Icons.home,
                      title: "Home",
                      selectedItem: selectedPage,
                      currentIndex: 0,
                    ),
                    DrawerItem(
                      icon: Icons.person,
                      title: "Profile",
                      selectedItem: selectedPage,
                      currentIndex: 1,
                    ),
                    DrawerItem(
                      icon: Icons.settings,
                      title: "Settings",
                      selectedItem: selectedPage,
                      currentIndex: 2,
                    ),
                  ],
                )),
            body: screens[selectedPage.value],
          );
        });
  }
}
