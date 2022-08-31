import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myproject/screens/home/home_screen.dart';
import 'package:myproject/test/test1.dart';
import 'package:myproject/widgets/buttons.dart';
import 'package:myproject/widgets/or_divider.dart';

import '../../constansts/color_const.dart';
import '../../services/validator/validate_handeler.dart';
import '../../widgets/already_have_an_account_acheck.dart';
import '../../widgets/textfileds.dart';
import 'background.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool status = false;
  String email = "";
  String password = "";

  String stringstatus = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Background(
                child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/loginpageimg.png",
                      width: size.width,
                    ),
                    SizedBox(height: size.height * 0.1),
                    Padding(
                      padding: EdgeInsets.only(bottom: size.height * 0.02),
                      child: SizedBox(
                        width: size.width * 0.8,
                        child: Gtextformfiled(
                          keybordtype: TextInputType.text,
                          hintText: "Email Address or Mobile",
                          onchange: (text) {
                            email = text;
                          },
                          save: (text) {
                            email = text!;
                          },
                          controller: emailcontroller,
                          valid: (text) {
                            return Validater.genaralvalid(text!);
                          },
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.01),
                        child: SizedBox(
                            width: size.width * 0.8,
                            child: Gpasswordformfiled(
                              onchange: (text) {
                                if (kDebugMode) {
                                  print(text);
                                }
                                password = text;
                              },
                              save: (text) {
                                password = text!;
                              },
                              controller: passwordcontroller,
                            ))),
                    status
                        ? Padding(
                            padding: EdgeInsets.only(
                              bottom: size.height * 0.05,
                            ),
                            child: Wrap(
                              children: [
                                Text(
                                  "Invalid email number or password ",
                                  style: TextStyle(
                                      fontSize: size.width * 0.03,
                                      color: Colors.redAccent),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            height: size.height * 0,
                          ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: size.height * 0.02,
                      ),
                      child: SizedBox(
                        width: size.width * 0.8,
                        child: Genaralbutton(
                          onpress: () async {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return HomeScreen();
                                  },
                                ),
                              );
                              // int r = 1;
                              // if (r == 0) {
                              //   print("loged");
                              //   Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) {
                              //         return Homescreen();
                              //       },
                              //     ),
                              //   );
                              // } else {
                              //   showSnackBarget(
                              //       "Opps!!", "Invalid Password or User Name");
                              //   setState(() {
                              //     status = true;
                              //   });
                              // }
                            }
                          },
                          color: kprimaryColor,
                          text: "LOG IN",
                          fontsize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Forgotten password ?",
                          style: TextStyle(
                              //fontSize: size.width * 0.025,
                              fontWeight: FontWeight.bold,
                              color: status ? kprimaryColor : kgrayColor),
                        ),
                      ),
                    ),
                    const OrDivider(),
                    AlreadyHaveAnAccountCheck(press: () {}),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                  ]),
            ))),
      ),
    );
  }
}
