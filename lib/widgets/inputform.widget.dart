import 'package:flutter/material.dart';

import '../helpers/dp_colors.dart';
import 'numpad.widget.dart';

class InputForm extends StatefulWidget {
  final TextEditingController myController;
  const InputForm({super.key, required this.myController});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: const EdgeInsets.only(top: 40),
        child: Numpad(
          buttonSize: 90,
          buttonColor: DpColors.mainBGButtonNumpad,
          iconColor: Colors.deepOrange,
          controller: widget.myController,
          delete: () {
            if (widget.myController.text.length > 2) {
              widget.myController.text = widget.myController.text
                  .substring(0, widget.myController.text.length - 1);
            }
          },
          onSubmit: () {
            debugPrint('Your code: ${widget.myController.text}');
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      content: Text("Your code is ${widget.myController.text}",
                          style: const TextStyle(fontSize: 30)),
                    ));
          },
        ),
      ),
      Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 60),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: DpColors.mainBGTextField),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
              child: SizedBox(
                height: 60,
                width: 280,
                child: Center(
                  child: TextField(
                    decoration: const InputDecoration(border: InputBorder.none),
                    controller: widget.myController,
                    textAlign: TextAlign.right,
                    showCursor: false,
                    style: TextStyle(
                        fontSize: 40,
                        color: DpColors.mainBlack,
                        shadows: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 4,
                              offset: const Offset(0, 4))
                        ]),
                    keyboardType: TextInputType.none,
                  ),
                ),
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
              child: Text(
                'Gcash Account',
                style: TextStyle(color: Colors.white, fontSize: 25),
                textAlign: TextAlign.left,
              ))
        ],
      )
    ]);
  }
}
