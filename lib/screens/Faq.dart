import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  bool _isTextVisible1=false;
  bool _isTextVisible2=false;bool _isTextVisible3=false;bool _isTextVisible4=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: mainTextColor,
      title: Text('FAQ',style:(TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 24))),
      leading: IconButton(
        icon: Icon(Icons.arrow_back,color:Colors.white), // Back arrow icon
        onPressed: () {
          Navigator.pop(context); // Navigate to the previous page
        },
      )),
 body: Column(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        GestureDetector(onTap: (){setState(() {
          _isTextVisible1 = !_isTextVisible1;
        });},
          child: Padding(
            padding: const EdgeInsets.only(right:15.0,left:15,bottom: 10),
            child: Card(color:Colors.white70,child:Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(Icons.question_answer,color:mainTextColor),
                    ),
                    Flexible(child: Text("What is the lifespan of solar panels, and do they require maintenance?",style:TextStyle(color:mainTextColor,fontWeight: FontWeight.bold))),
                  ],

                ),if(_isTextVisible1)
                  Padding(
                    padding: const EdgeInsets.only(top:10.0,bottom: 10,right:18,left:18),
                    child: Text("Solar panels typically last 25-30 years or more. They require minimal maintenance, mainly periodic cleaning to remove dirt and debris. Most systems come with warranties of 20-25 years, ensuring long-term reliability.",style:TextStyle(color:green)),
                  ),
              ],
            )),
          ),
        ),
        GestureDetector(onTap: (){setState(() {
          _isTextVisible2 = !_isTextVisible2;
        });},
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0,left:15,bottom: 10),
            child: Card(color:Colors.white70,child:Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(Icons.question_answer,color:mainTextColor),
                    ),
                    Flexible(child: Text(" How much can I save by installing solar panels?",style:TextStyle(color:mainTextColor,fontWeight: FontWeight.bold))),
                  ],

                ),if(_isTextVisible2)
                  Padding(
                    padding: const EdgeInsets.only(top:10.0,bottom: 10,right:18,left:18),
                    child: Text(" The savings from solar panels vary depending on your location, energy usage, and local electricity rates. On average, homeowners can reduce their electricity bills by 50-75%, with most systems paying for themselves in 5-10 years.",
                    style:TextStyle(color:green)),
                  ),
              ],
            )),
          ),
        ),GestureDetector(onTap: (){setState(() {
          _isTextVisible4 = !_isTextVisible4;
        });},
          child: Padding(
            padding: const EdgeInsets.only(right:15,left:15),
            child: Card(color:Colors.white70,child:Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(Icons.question_answer, color:mainTextColor),
                    ),
                    Flexible(child: Text("Can solar panels work during cloudy days or at night?",style:TextStyle(color:mainTextColor,fontWeight: FontWeight.bold))),
                  ],

                ),if(_isTextVisible4)
                  Padding(
                    padding: const EdgeInsets.only(top:10.0,bottom: 10,right:18,left:18),
                    child: Text("Solar panels generate electricity from sunlight, so they produce less power on cloudy days and do not work at night. However, most systems are connected to the grid or include battery storage to ensure a consistent power supply.",style:TextStyle(color:green)),
                  ),
              ],
            )),
          ),
        ),],
    ));

  }
}
