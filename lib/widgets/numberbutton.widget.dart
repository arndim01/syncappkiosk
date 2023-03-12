import 'package:flutter/material.dart';

import '../helpers/dp_colors.dart';

class NumberButton extends StatelessWidget {
  final int number;
  final double size;
  final Color color;
  final TextEditingController controller;

  const NumberButton({
    Key? key,
    required this.number,
    required this.size,
    required this.color,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          if( controller.text.length < 11 ){
            controller.text += number.toString();
          }
        },
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
                shadows: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4,
                      offset: const Offset(0, 4))
                ],
                fontWeight: FontWeight.bold,
                color: DpColors.mainBlack,
                fontSize: 30),
          ),
        ),
      ),
    );
  }
}
