import 'package:flutter/material.dart';
import 'package:test2/constants/color_constants.dart';

class DrawerItem extends StatefulWidget {
  const DrawerItem({super.key, required this.title,required this.icon, required this.selectedItem, required this.currentIndex});

  final String title;
  final IconData icon;
  final ValueNotifier<int> selectedItem;
  final int currentIndex;
  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: (){
              widget.selectedItem.value=widget.currentIndex;
              Navigator.pop(context);
            },
            child: Card(
              color: widget.selectedItem.value==widget.currentIndex?green:Colors.white70,
              child:
              Padding(
                padding: const EdgeInsets.all(16),

                child: Row(
    children: [
    Icon(widget.icon,color:  widget.selectedItem.value==widget.currentIndex?Colors.white:mainTextColor),
    SizedBox(width: 13,),

    Text(widget.title, style: TextStyle(color:  widget.selectedItem.value==widget.currentIndex?Colors.white:mainTextColor)),
    ],



                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
