import 'package:flutter/material.dart';
import 'package:myproject/constansts/color_const.dart';
import 'package:myproject/widgets/buttons.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  get kPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    String logingText = login
        ? "CREATE NEW FACEBOOK ACCOUNT"
        : "Already have an Account ? Sign In";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Genaralbutton(
          onpress: () {
            press;
          },
          color: Colors.green,
          text: logingText,
          fontsize: 15,
        )
      ],
    );
  }
}
