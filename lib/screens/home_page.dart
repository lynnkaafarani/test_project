import 'package:flutter/material.dart';
import 'package:test2/screens/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color myColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('My app'),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications_on_sharp,
            color: myColor,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.calendar_month_sharp,
                color: Colors.white,
              )),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
            },
            icon: Icon(
              Icons.light_mode_sharp,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'my text',
                style: TextStyle(fontSize: 24, color: myColor),
              ),
              SizedBox(width: 10),
              Text(
                'my text',
                style: TextStyle(fontSize: 24, color: myColor),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'my text',
                style: TextStyle(fontSize: 24, color: myColor),
              ),
              SizedBox(width: 10),
              Text(
                'my text',
                style: TextStyle(fontSize: 24, color: myColor),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: myColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: () {
                setState(() {
                  myColor = Colors.red;
                });
                // Action for Red Button
                print('Red Button Pressed');
              },
              child: Text(
                'Red',
                style: TextStyle(color: Colors.white),
              ),
            ),

            SizedBox(width: 20), // Add some space between the buttons
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: myColor,
                  foregroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: () {
                setState(() {
                  myColor = Colors.blue;
                });

                // Action for Blue Button
                print('Blue Button Pressed');
              },
              child: Text(
                'Blue',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ]),
          Image(
            width: 30,
            height: 30,
            image: AssetImage('photo/hi.jpg'),
          )
        ],
      ),
    );
  }
}
