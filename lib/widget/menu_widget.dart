import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final Color colorBg;
  final IconData iconPath;
  final Color colorIc;
  final String title;

  const MenuWidget({
    super.key,
    required this.colorBg,
    required this.iconPath,
    required this.colorIc,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: colorBg,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                iconPath,
                color: colorIc,
                size: 35,
              )),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
              color: Colors.black87, fontSize: 12, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
