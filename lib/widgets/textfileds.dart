import 'package:flutter/material.dart';
import 'package:myproject/constansts/color_const.dart';
import '../services/validator/validate_handeler.dart';

////////////////// textfiled//////////////////////////////////

class Gtextformfiled extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxlines;
  final TextInputType textinput;
  final Function(String) onchange;
  final Function(String?) save;
  final String? Function(String?) valid;
  const Gtextformfiled({
    this.hintText = "Text",
    required this.onchange,
    required this.valid,
    required this.save,
    this.textinput = TextInputType.text,
    Key? key,
    required this.controller,
    this.maxlines = 1,
    required TextInputType keybordtype,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchange,
      maxLines: maxlines,
      onSaved: save,
      controller: controller,
      validator: valid,
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: kgrayColor,
            width: 1.0,
          ),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: kgrayColor,
            width: 1.0,
          ),
        ),
        hintText: hintText,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: kgrayColor, width: 1.0),
        ),
      ),
    );
  }
}

////////////////// passwordfiled//////////////////////////////////
class Gpasswordformfiled extends StatefulWidget {
  final String hintText;

  final TextInputType textinput;
  final Function(String) onchange;
  final Function(String?) save;
  final TextEditingController controller;
  const Gpasswordformfiled({
    this.hintText = "Password",
    required this.onchange,
    required this.save,
    this.textinput = TextInputType.text,
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<Gpasswordformfiled> createState() => _GpasswordformfiledState();
}

class _GpasswordformfiledState extends State<Gpasswordformfiled> {
  bool isHidepassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isHidepassword,
      validator: (text) {
        return Validater.signupPassword(text!);
      },
      onChanged: widget.onchange,
      onSaved: widget.save,
      controller: widget.controller,
      decoration: InputDecoration(
          hintText: widget.hintText,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: kgrayColor,
              width: 1.0,
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: kgrayColor,
              width: 1.0,
            ),
          ),
          // labelText: widget.hintText,
          suffixIcon: InkWell(
              onTap: _viewPassword, child: const Icon(Icons.visibility)),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: kgrayColor,
              width: 1.0,
            ),
          )),
    );
  }

  void _viewPassword() {
    if (isHidepassword == true) {
      isHidepassword = false;
    } else {
      isHidepassword = true;
    }
    setState(() {});
  }
}
