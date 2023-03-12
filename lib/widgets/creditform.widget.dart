import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncappkiosk/controllers/transaction.controller.dart';
import 'package:syncappkiosk/helpers/dp_colors.dart';
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
  @override
  void initState() {
    messageController.channel =
        WebSocketChannel.connect(Uri.parse('ws://localhost:1337'));
    broadcastStream = messageController.channel!.stream.asBroadcastStream();
    messageController.amount.clear();
    referenceNumber = transactionController.receipt.getReferenceNumber;
    messageController.sendMessage('c');
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
                transactionController.addAmountValue(snapshot.data.toString());
                if (referenceNumber != '') {
                  if (_isNumeric(snapshot.data.toString())) {
                    transactionController.createLog(
                        referenceNumber, int.parse(snapshot.data.toString()));
                  }
                }
                double sum = 0;
                for (var n in transactionController.amountList) {
                  sum+=n;
                }
                return Text(
                  sum.toStringAsFixed(2),
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
        )
      ],
    );
  }
}
