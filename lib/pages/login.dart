import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uac_concours/constant/colors.dart';
import 'package:uac_concours/constant/widget_designe.dart';
import 'package:uac_concours/helper_tools/loading.dart';


class Login extends StatefulWidget {

  final Function toggleView;
  final String title;
  Login({Key key, this.title, this.toggleView,}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController passwordController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  SharedPreferences prefs;
  int statusCode=200;

  final formKey = GlobalKey<FormState>();
  bool isLoading = false,success=true,logged=false;
  loginFunc() async {

  }

  selfInit() async {
    prefs = await SharedPreferences.getInstance();
  }
  @override
  void initState() {
    // TODO: implement initState
    selfInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: ListView(
                children: <Widget>[
                  Image.asset(
                    "assets/uac.jpg",
                  ),

                  SizedBox(height: 30,),
                  !success?Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "!!! Authentication failed"
                            ".\nDid you have an account? ",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red,
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.toggleView();
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ) :Container(),
                  SizedBox(height: 30,),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) {
                            return RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val)
                                ? null
                                :"Please Enter Correct Email";
                          },
                          controller: emailController,
                          style: simpleTextStyle(),
                          decoration: textFieldInputDecoration("Email",Icon(Icons.mail)),
                        ),
                        TextFormField(
                          obscureText: true,
                          validator: (val) {
                            return val.length > 8
                                ? null
                                :"Enter Password 8+ characters";
                          },
                          style: simpleTextStyle(),
                          controller: passwordController,
                          decoration: textFieldInputDecoration("password",Icon(Icons.lock)),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 32,
                  ),
                  GestureDetector(
                    onTap: () {
                      loginFunc();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              themeColor,
                              themeColor
                            ],
                          )),
                      width: MediaQuery.of(context).size.width,

                      child: Text(
                        "Login",
                        style: biggerTextStyle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),

                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account? ",
                        style: simpleTextStyle(),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.toggleView();
                        },
                        child: Text(
                          "Register now",
                          style: TextStyle(
                              color: themeColor,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            // Loading
            Positioned(
              child: statusCode!=200?
                  AlertDialog(
                    title: Text("Warning"),
                    content: Text('Connection not Established'),
                    actions: [
                      FlatButton(
                        child: Text('OK'),
                        onPressed: (){
                          setState(() {
                            isLoading=false;
                            statusCode=200;
                          });
                        },
                      )
                    ],
                  ):isLoading?
                   Loading(0)
                  : Container(),
            ),
          ],
        )

    );

  }
}
