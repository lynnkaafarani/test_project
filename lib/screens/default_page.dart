import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test2/constants/color_constants.dart';
import 'package:test2/provider/user_provider.dart';
import 'package:test2/widgets/drawer_item.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _State();
}

///
class _State extends State<DefaultPage> {
  ValueNotifier<int> selectedPage = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: selectedPage,
        builder: (context, val, _) {
          return Consumer<UserProvider>(builder: (context, provider, _) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: mainTextColor,
                title: Text(
                  provider.userResponse.userMenu[selectedPage.value].desc,
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
                        provider.userResponse.userProfile.fullName,
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
                            itemCount: provider.userResponse.userMenu.length,
                            itemBuilder: (context, index) {
                              return DrawerItem(
                                  title: provider
                                      .userResponse.userMenu[index].desc,
                                  icon: provider.icon[index],
                                  selectedItem: selectedPage,
                                  currentIndex: index);
                            }),
                      ),
                    ],
                  )),
              body: provider.screens[selectedPage.value],
            );
          });
        });
  }
}
