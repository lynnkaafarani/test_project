import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class Services extends StatefulWidget {
  const Services({super.key, required this.icon,required this.text1,required this.text2});
final IconData icon;
final String text1;
final String text2;
  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  bool _isTextVisible = false;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
       GestureDetector(
            onTap: () {
              setState(() {
                _isTextVisible = !_isTextVisible;
              });
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width/2.2,
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    side: BorderSide(
                      color: mainTextColor,

                      width: 2.0,
                    ),
                  ),
                  color: Colors.white70,
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        widget.icon,
                        color: gg,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(widget.text1,
                                  style: TextStyle(
                                    color: mainTextColor,
                                  ),),
                      
                            if (_isTextVisible)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  child: Text(
                                   widget.text2,
                                    style: TextStyle(
                                      color: gg,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),

                  ])),
            ),
          )
    ]);
  }
}
