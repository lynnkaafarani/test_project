import 'package:flutter/material.dart';
import 'package:test2/widgets/abt_us.dart';
import 'package:weather/weather.dart';
import '../constants/color_constants.dart';
import '../widgets/sevices.dart';

class AbousUs extends StatefulWidget {
  const AbousUs({super.key});

  @override
  State<AbousUs> createState() => _AbousUsState();
}

class _AbousUsState extends State<AbousUs> {
  WeatherFactory wf = new WeatherFactory("16a4f31f97040c0dd3d097be3d912e0d");
  late Weather w;
  bool weathereload = false;
  bool _isTextVisible = false;

  @override
  void initState() {
    super.initState();
    getWeatherr();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(children: [
            Container(
              // width: MediaQuery.of(context).size.width*0.65,
              //  height: MediaQuery.of(context).size.height*0.89,
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('insta/one.jpeg'),

                  fit: BoxFit.cover,
                  // fit: BoxFit.fill,
                ),
              ),
            ),
          ]), if (!weathereload)
            Center(child: CircularProgressIndicator())
          else ...[
              Padding(
                padding: const EdgeInsets.only(right:8.0,left:8,),
                child: Card(
                  color:Color(0xffB8E2F2),//89C6F0
                    child: Row(children: [

                      Padding(
                        padding: const EdgeInsets.only(right: 58.0, left: 58,top:28,bottom:28),
                        child: Text(w.areaName.toString(),
                            style: TextStyle(color: mainTextColor, fontSize: 28)),
                      ),
                      Column(
                        children: [
                          Text(
                            w.date.toString().substring(0, 10),
                            style: TextStyle(color: mainTextColor),
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(w.temperature.toString().substring(0, 4),
                                  style: TextStyle(
                                    color: mainTextColor,
                                  )),
                              Text("°C", style: TextStyle(color: mainTextColor)),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                getWeatherIcon(w),
                                color: mainTextColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ]),
                  ),
              ),

            ],

          Padding(
                      padding: const EdgeInsets.only(right: 18.0, left: 18, ),
                      child: Divider(
                        thickness: 2,
                        color: mainTextColor,
                      ),
                    ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
              ),
              child: Text("About Us",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: mainTextColor,
                      fontSize: 30)),
            ),
          ]),
          AbtUs(
              text:
                  "taqa energy is a privately owned company that provides renewable energy solutions and services to public and private sectors. Services and activities include maintenance, construction, planning and design, customer support and consultancy."),
          Padding(
            padding: const EdgeInsets.only(right: 18.0, left: 18, top: 18),
            child: Divider(
              thickness: 2,
              color: mainTextColor,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
              ),
              child: Text("Our Services",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: mainTextColor,
                      fontSize: 30)),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(left:18.0),
            child: Row(
              children: [
                Services(
                  icon: Icons.engineering,
                  text1: "Support",
                  text2:
                  "Customer service agents are always ready to handle customers’ inquiries and provide prompt assistance and support",
                ),
                Services(
                    icon: Icons.build,
                    text1: "Maintenance",
                    text2:
                    "Technical support and preventive/corrective maintenance activities are conducted by experienced technicians."),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left:18.0),
            child: Row(
              children: [
                Services(
                    icon: Icons.construction,
                    text1: "Construction",
                    text2:
                    "Implementing renewable energy projects by adopting best practices and deploying a strong team of engineers and technicians"),
                Services(
                    icon: Icons.business_center,
                    text1: "Consultancy",
                    text2:
                    "Benefiting from years of cumulative experience and success, our project management office can provide consultancies in the energy and utility sector."),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 18.0, left: 18, top: 18),
            child: Divider(
              thickness: 2,
              color: mainTextColor,
            ),
          ),

          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
              ),
              child: Text("Why Choosing Us?",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: mainTextColor,
                      fontSize: 30)),
            ),
          ]),
          AbtUs(text: "After-sale customer support & maintenance"),
          // SizedBox(width: 96,),
          AbtUs(text: "Net metering application support"),
          AbtUs(text: "Product warranties"),
          AbtUs(text: "Solutions engineered & designed to fit your needs"),

          Padding(
            padding: const EdgeInsets.only(right: 18.0, left: 18, top: 18),
            child: Divider(
              thickness: 2,
              color: mainTextColor,
            ),
          ),Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 18.0,
              ),
              child: Text("Contact Us",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: mainTextColor,
                      fontSize: 30)),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start,children: [
            Padding(
              padding: const EdgeInsets.only(left:28.0),
              child: Icon(Icons.phone,color:gg),
            ),
            SizedBox(width: 25,),
            Text("Phone: +961 1 744891",style:TextStyle(color:mainTextColor)),

          ],),
          Row(mainAxisAlignment: MainAxisAlignment.start,children: [
            Container(child: Padding(
              padding: const EdgeInsets.only(left:28.0),
              child: Icon(Icons.fax,color:gg),
            )),
            SizedBox(width: 25,),
            Text("Fax: +961 1 744895",style:TextStyle(color:mainTextColor)),

          ],),Row(mainAxisAlignment: MainAxisAlignment.start,children: [
            Padding(
              padding: const EdgeInsets.only(left:28.0),
              child: Icon(Icons.email,color:gg),
            ),
            SizedBox(width: 25,),
            Text("Email: info@taqa-energies.com",style:TextStyle(color:mainTextColor)),


          ],),
          SizedBox(height: 25,),


          // else
        ],
      ),
    );
  }

  Future getWeatherr() async {
    w = await wf.currentWeatherByCityName("Beirut");
    setState(() {
      weathereload = true;
    });
    print(w.temperature);
  }

  IconData getWeatherIcon(Weather w) {
    if (w.weatherConditionCode != null) {
      int code = w.weatherConditionCode!;
      if (code == 800) {
        return Icons.wb_sunny; // Sunny icon
      } else if (code > 800 && code < 900) {
        return Icons.wb_cloudy; // Cloudy icon
      } else if (code >= 200 && code < 600) {
        return Icons.grain; // Rainy icon
      }
    }
    return Icons.help_outline;
  }
}
