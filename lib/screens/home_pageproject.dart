import 'package:flutter/material.dart';
import 'package:test2/constants/color_constants.dart';

class HomePageproject extends StatefulWidget {
  const HomePageproject({super.key});

  @override
  State<HomePageproject> createState() => _State();
}

class _State extends State<HomePageproject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainTextColor,
        title: Text('About Us',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        actions: [
          Container(
            color: mainTextColor,
            child:
            Image(
              image: AssetImage('insta/mrad.png'),width: 66,
                    height: 66,

            )
          ),
          SizedBox(width: 44,)

        ],
      ),
    );
  }
}
