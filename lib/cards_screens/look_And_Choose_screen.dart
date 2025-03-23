// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:preschool_flutter/widgets/subcategory.dart';

class LookAndChoose extends StatelessWidget {
  const LookAndChoose({super.key});

  @override
  Widget build(BuildContext context) {
    return Subcategory(condition: 2,title: 'Look And Choose',);
  }
}