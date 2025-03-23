// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


PreferredSizeWidget? Appbar({String? title, Function()? onpress,bool isLeading=true}) {
  return AppBar(
    leading: isLeading? IconButton(
      icon: Image.asset('assets/icons/btn_back_150.png', width: 35, height: 35),
      onPressed: onpress,
    ):SizedBox(),
    title: Text(title!,
        style:
            TextStyle(color: Color(0xFF1C6232), fontWeight: FontWeight.bold)), 
    backgroundColor: Color(0xFFFFD316),
  );
}
