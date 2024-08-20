import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class AbtUs extends StatefulWidget {
  const AbtUs({super.key,required this.text});
  final String text;

  @override
  State<AbtUs> createState() => _AbtUsState();
}

class _AbtUsState extends State<AbtUs> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 14,),
        Expanded(
          child: Card(color: Colors.white70,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 18,top:18,left: 18),
                child: Center(

                  child: Text(
                    widget.text,
                    style: TextStyle(color: mainTextColor,),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 14,)

      ],
    );

  }
}
