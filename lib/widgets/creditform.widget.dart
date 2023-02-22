import 'package:flutter/material.dart';
import 'package:syncappkiosk/helpers/dp_colors.dart';

class CreditForm extends StatefulWidget {
  const CreditForm({super.key});

  @override
  State<CreditForm> createState() => _CreditState(); 
}

class _CreditState extends State<CreditForm> {
final TextEditingController _myController = TextEditingController(text: '10000.00');

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Align( 
          alignment: Alignment.center,
          child: Text('Start insert coin/bill.', style: TextStyle( fontSize: 80, color: Colors.white)),
        ),
        const Align(
          alignment: Alignment.center ,
          child: Text('No refund!', style: TextStyle(fontSize: 60, color: DpColors.mainRed)),
        ),
        Align(
          alignment:  Alignment.center,
          child: SizedBox(
            height: 150,
            width: 600,
            child: TextField(
            decoration: const InputDecoration( border: InputBorder.none),
            controller: _myController,
            textAlign: TextAlign.center ,
            showCursor: false,
            readOnly: true,
            style: TextStyle(
              fontSize: 120,
              color: Colors.white,
              
              shadows: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4))
              ]
            ),
            keyboardType: TextInputType.none,
          ),
          ),
        )
      ],
    );
  }

}