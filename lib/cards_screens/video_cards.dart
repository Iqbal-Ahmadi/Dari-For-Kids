// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:preschool_flutter/services/networking.dart';
import 'package:preschool_flutter/widgets/appbar.dart';

class Videos extends StatelessWidget {
  Videos({super.key});


  // void network() {
  //   NetworkHelper net = NetworkHelper();
  //   var data = net.getData();
  //   print(data);
  // }

  @override
  Widget build(BuildContext context) {
    // network();
    return Scaffold(
        appBar: Appbar(
            title: 'Video Learning', onpress: () => Navigator.pop(context)));
  }
}
