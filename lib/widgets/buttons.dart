import 'package:flutter/material.dart';

import '../constansts/color_const.dart';

class Genaralbutton extends StatelessWidget {
  final Color color;
  final Color textcolor;
  final String text;
  final double pleft;
  final double pright;
  final double ptop;
  final double pbottom;
  final Function onpress;
  final double fontsize;
  const Genaralbutton({
    this.color = kprimaryColor,
    this.textcolor = Colors.white,
    this.text = "Button",
    this.pleft = 15,
    this.pright = 15,
    this.ptop = 10,
    this.pbottom = 10,
    Key? key,
    required this.onpress,
    this.fontsize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onpress();
      },
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.only(
              left: pleft, right: pright, top: ptop, bottom: pbottom)),
      child: Text(
        text,
        style: TextStyle(color: textcolor, fontSize: fontsize),
      ),
    );
  }
}
