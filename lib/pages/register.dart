

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uac_concours/constant/colors.dart';
import 'package:uac_concours/constant/widget_designe.dart';
import 'package:uac_concours/helper_tools/loading.dart';


class Register extends StatefulWidget {

  final Function toggleView;
  final String title;
  Register({Key key, this.title, this.toggleView,}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController passwordConfirmController = new TextEditingController();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  int statusCode=200;

  final formKey = GlobalKey<FormState>();
  bool isLoading = false,error=false,success=false;
  String countType = '';
  registerFunc() async {


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
                Center(child: Text("Registration-uacApp",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),),),
                SizedBox(height: 30,),
                success?Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Successful registration. Click to ",
                      style: TextStyle(color: Colors.green),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.toggleView();
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                )
                    :error?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Registration Failed",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                )
                    :Container(),
                SizedBox(height: 30,),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (val) {
                          return val.length >= 4
                              ? null
                              :"Enter name 4+ characters";
                        },
                        controller:lastNameController,
                        style: simpleTextStyle(),
                        decoration: textFieldInputDecoration("Last name",Icon(Icons.person_add)),
                      ),
                      TextFormField(
                        validator: (val) {
                          return val.length >= 3
                              ? null
                              :"Enter name 3+ characters";
                        },
                        controller: firstNameController,
                        style: simpleTextStyle(),
                        decoration: textFieldInputDecoration("First name",Icon(Icons.person_add)),
                      ),
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
                      TextFormField(
                        obscureText: true,
                        controller: passwordConfirmController,
                        validator: (val) {
                          return val== passwordController.text
                              ? null
                              : "Not Equal";
                        },
                        style: simpleTextStyle(),
                        decoration: textFieldInputDecoration("Confirm Password",Icon(Icons.lock)),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: () {
                    registerFunc();
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
                      "Register",
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
                      "Already have an account? ",
                      style: simpleTextStyle(),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.toggleView();
                      },
                      child: Text(
                        "Login now",
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
