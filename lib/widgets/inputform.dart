import 'package:flutter/material.dart';
import 'package:syncappkiosk/helpers/dp_colors.dart';
import 'package:syncappkiosk/widgets/numpad.dart';

class InputForm extends StatefulWidget {
  const InputForm({super.key});

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final TextEditingController _myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: const EdgeInsets.only(top: 40),
        child: Numpad(
          buttonSize: 60,
          buttonColor: DpColors.mainBGButtonNumpad,
          iconColor: Colors.deepOrange,
          controller: _myController,
          delete: () {
            _myController.text =
                _myController.text.substring(0, _myController.text.length - 1);
          },
          onSubmit: () {
            debugPrint('Your code: ${_myController.text}');
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      content: Text("Your code is ${_myController.text}",
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
                height: 40,
                width: 200,
                child: Center(
                  child: TextField(
                    decoration: const InputDecoration(border: InputBorder.none),
                    controller: _myController,
                    textAlign: TextAlign.right,
                    showCursor: false,
                    style: TextStyle(
                        fontSize: 30,
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
                style: TextStyle(color: Colors.white, fontSize: 15),
                textAlign: TextAlign.left,
              ))
        ],
      )
    ]);
  }
}
