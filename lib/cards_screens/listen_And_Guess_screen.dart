// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:preschool_flutter/widgets/subcategory.dart';

class ListenAndGuess extends StatelessWidget {
  const ListenAndGuess({super.key});

  @override
  Widget build(BuildContext context) {
    return Subcategory(condition: 3, title: 'Listen And Guess',);
  }
}
