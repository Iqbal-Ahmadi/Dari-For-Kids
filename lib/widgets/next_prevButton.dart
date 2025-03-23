
import 'package:flutter/material.dart';

class NextAndPrevButton extends StatelessWidget {
  const NextAndPrevButton({super.key, this.onpress, this.image});
  final Function()? onpress;
  final String? image;
  @override
  Widget build(BuildContext context) {
    // return RawMaterialButton(
    //     shape: CircleBorder(),
    //     onPressed: onpress,
    //     child: Image.asset('$image', width: 50, height: 50));
    return IconButton(
        icon: Image.asset(
          '$image',
          width: 50,
          height: 50,
        ),
        onPressed: onpress);
  }
}