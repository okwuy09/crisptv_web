import 'package:crisptv_media/component/style.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class AdminButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color iconcolor;
  const AdminButton({
    Key? key,
    required this.icon,
    required this.color,
    required this.iconcolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width / 10,
      height: screenSize.height / 6,
      padding: EdgeInsets.only(left: screenSize.width / 30),
      color: color,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Icon(
          icon,
          size: 30,
          color: iconcolor,
        ),
      ),
    );
  }
}
