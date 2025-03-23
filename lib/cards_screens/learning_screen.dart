// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:preschool_flutter/widgets/subcategory.dart';

class ABCScreen extends StatelessWidget {
  ABCScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Subcategory(condition: 1,title: 'Let\'s Start Learning',);
  }
}
