import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncappkiosk/controllers/transaction.controller.dart';
import '../controllers/message.controller.dart';
import '../widgets/creditform.widget.dart';
import '../helpers/dp_colors.dart';
import '../widgets/appheader.widget.dart';

class CreditFormPage extends StatefulWidget {
  const CreditFormPage({super.key});

  @override
  State<CreditFormPage> createState() => _CreditFormState();
}

class _CreditFormState extends State<CreditFormPage> {
  final messageController = Get.put(MessageController());
  final transactionController = Get.put(TransactionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DpColors.mainBG,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppHeader(),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (messageController.getTotalAmount() == 0)
                Align(
                  alignment: Alignment.center,
                  child: Ink(
                    width: 180,
                    height: 350,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage('./assets/imgs/back-bg.png'),
                            filterQuality: FilterQuality.medium,
                            fit: BoxFit.fill),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10)),
                    child: InkWell(
                      customBorder: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(300),
                              bottomRight: Radius.circular(300))),
                      child: const Icon(Icons.arrow_circle_left_outlined,
                          size: 140, color: Colors.white),
                      onTap: () {
                        if (transactionController.amountList.isEmpty) {
                          messageController.sendMessage('r');
                          messageController.setNewValue();
                          Navigator.of(context).pushNamed('/gcashform');
                        } else {
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    contentPadding: const EdgeInsets.only(
                                        left: 50, top: 10, right: 50),
                                    actionsPadding: const EdgeInsets.all(20),
                                    title: const Text('Error Transaction',
                                        style: TextStyle(fontSize: 80)),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: const <Widget>[
                                          Text(
                                              'You cannot cancel the transaction if you already inserted coin/bill',
                                              style: TextStyle(fontSize: 50)),
                                          Text(
                                              'Press the proceed button to continue the transaction.',
                                              style: TextStyle(fontSize: 50))
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Ok',
                                            style: TextStyle(fontSize: 60)),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ));
                        }
                      },
                    ),
                  ),
                )
              else
                const SizedBox(width: 260),
              const CreditForm(),
              Align(
                alignment: Alignment.center,
                child: Ink(
                  width: 180,
                  height: 350,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('./assets/imgs/ok-bg.png'),
                          filterQuality: FilterQuality.medium,
                          fit: BoxFit.fill),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: InkWell(
                    customBorder: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(300),
                            bottomLeft: Radius.circular(300))),
                    child: const Icon(Icons.arrow_circle_right_outlined,
                        size: 140, color: Colors.white),
                    onTap: () async {
                      messageController.sendMessage('r');
                      messageController.setNewValue();
                      transactionController.setTransactionAmountDetails();
                      transactionController
                          .updateLog(
                              transactionController.receipt.getReferenceNumber)
                          .then((value) {
                        Navigator.of(context).pushNamed('/receiptform');
                      }).onError((error, stackTrace) {
                        print(error);
                      });
                    },
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
