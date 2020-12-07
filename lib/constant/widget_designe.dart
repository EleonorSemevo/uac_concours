import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

InputDecoration textFieldInputDecoration(String hintText,Icon icon) {
  return InputDecoration(
      icon: icon,
      labelText: hintText,
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.black45),
      focusedBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: themeColor)),
      enabledBorder:
      UnderlineInputBorder(borderSide: BorderSide(color: themeColor)));
}

TextStyle simpleTextStyle() {
  return TextStyle(color: Colors.black, fontSize: 16);
}

TextStyle biggerTextStyle() {
  return TextStyle(color: Colors.white, fontSize: 17);
}
