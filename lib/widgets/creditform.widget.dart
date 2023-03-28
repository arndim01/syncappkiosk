import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:syncappkiosk/controllers/transaction.controller.dart';
import 'package:syncappkiosk/helpers/dp_colors.dart';
import 'package:syncappkiosk/models/transaction/captureamount.model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../controllers/message.controller.dart';

class CreditForm extends StatefulWidget {
  const CreditForm({super.key});
  @override
  State<CreditForm> createState() => _CreditState();
}

class _CreditState extends State<CreditForm> {
  final transactionController = Get.put(TransactionController());
  final messageController = Get.put(MessageController());
  String referenceNumber = '';
  late Stream broadcastStream;
  bool _isBillButtonDisabled = false;
  bool _isCoinButtonDisabled = false;
  late List<CaptureAmount> ListCaptureAmount;

  void _BillOpen(){
    setState(() {
      _isBillButtonDisabled = true;
      _isCoinButtonDisabled = false;  
    });
    messageController.sendMessage('y');
  }

  void _CoinOpen(){
    setState(() {
      _isCoinButtonDisabled = true;
      _isBillButtonDisabled = false;
      
    });
    messageController.sendMessage('x');
  }

  @override
  void initState() {
    messageController.channel =
        WebSocketChannel.connect(Uri.parse('ws://localhost:1337'));
    broadcastStream = messageController.channel!.stream.asBroadcastStream();
    messageController.amount.clear();
    referenceNumber = transactionController.receipt.getReferenceNumber;
    ListCaptureAmount = List<CaptureAmount>.empty(growable: true);
    super.initState();
  }

  bool _isNumeric(String str) {
    if (str.isEmpty) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Align(
          alignment: Alignment.center,
          child: Text('Start insert coin/bill.',
              style: TextStyle(fontSize: 80, color: Colors.white)),
        ),
        const Align(
          alignment: Alignment.center,
          child: Text('No refund!',
              style: TextStyle(fontSize: 60, color: DpColors.mainRed)),
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 150,
            width: 600,
            child: StreamBuilder(
              stream: broadcastStream,
              builder: (context, snapshot) {
                double sum = 0;
                if( snapshot.hasData ){
                  CaptureAmount capture = CaptureAmount.fromJson(json.decode(snapshot.data.toString()));
                  print(capture.value);
                  if( capture.value!.trim() == "progress" ){
                    context.loaderOverlay.show();
                    
                  }
                  
                  if( ListCaptureAmount.where((element) => element.id == capture.id).isEmpty ){  
                    if (referenceNumber != '') {
                      if (_isNumeric(capture.value!)) {
                        context.loaderOverlay.hide();
                        ListCaptureAmount.add(capture);
                        transactionController.addAmountValue(capture.value!);
                        transactionController.createLog(
                            referenceNumber, int.parse(capture.value!));
                      }
                    }
                    for (var n in transactionController.amountList) {
                      sum+=n;
                    }
                  }
                }
                
                return Text(
                  transactionController.getTotalAmount().toString(),
                  style:
                      TextStyle(fontSize: 120, color: Colors.white, shadows: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4))
                  ]),
                  textAlign: TextAlign.center,
                );
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 100,
            width: 550 ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Ink(
                    decoration: BoxDecoration(
                      color: _isBillButtonDisabled? DpColors.mainBGButtonNumpad : DpColors.mainBlue,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 4,
                            offset: const Offset(0, 4))
                      ]
                    ),
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                        width: 250,
                        height: 86,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              _isBillButtonDisabled? 'Start insert bill' :'Insert bill',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontSize: _isBillButtonDisabled? 30 :45),
                              textAlign: TextAlign.center,
                            ))),
                        onTap: () => _BillOpen(),
                    ),
                  ),
                ),
                Container(
                  child: Ink(
                    decoration: BoxDecoration(
                      color: _isCoinButtonDisabled? DpColors.mainBGButtonNumpad : DpColors.mainBlue,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 4,
                            offset: const Offset(0, 4))
                      ]
                    ),
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: SizedBox(
                        width: 250,
                        height: 86,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              _isCoinButtonDisabled? 'Start insert coin' :'Insert Coin',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontSize: _isCoinButtonDisabled? 30 :45),
                              textAlign: TextAlign.center,
                            ))),
                        onTap: () => _isCoinButtonDisabled? null: _CoinOpen(),
                    ),
                  ),
                )
              ])),
        )
      ],
    );
  }
}
