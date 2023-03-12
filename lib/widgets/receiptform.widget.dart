import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncappkiosk/helpers/dp_colors.dart';
import '../controllers/transaction.controller.dart';

class ReceiptForm extends StatefulWidget {
  const ReceiptForm({super.key});
  @override
  State<ReceiptForm> createState() => _ReceiptFormState();

}

class _ReceiptFormState extends State<ReceiptForm> {
  final transactionController = Get.put(TransactionController());
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(left: 50),
              child: Column(
              
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 600,
                height: 80,
                child: Text('Receipt', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 50, shadows: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4))
                  ])),
              ),
              Container(
                width: 600,
                height: 400,
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            )
            ,           
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text('Reference #', style: TextStyle(color: DpColors.mainBlack, fontWeight: FontWeight.bold, fontSize: 30, shadows: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4))
                  ]))),
                    Expanded(child: Text(transactionController.receipt.getReferenceNumber, style: TextStyle(color: DpColors.mainBlack, fontWeight: FontWeight.bold, fontSize: 30, shadows: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4))
                  ])))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text('GCash acc.', style: TextStyle(color: DpColors.mainBlack, fontWeight: FontWeight.bold, fontSize: 30, shadows: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4))
                  ]))),
                    Expanded(child: Text(transactionController.receipt.getAccountNumber, style: TextStyle(color: DpColors.mainBlack, fontWeight: FontWeight.bold, fontSize: 30, shadows: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4))
                  ])))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text('Fee', style: TextStyle(color: DpColors.mainBlack, fontWeight: FontWeight.bold, fontSize: 30, shadows: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4))
                  ]))),
                    Expanded(child: Text(transactionController.receipt.getFee.toString(), style: TextStyle(color: DpColors.mainBlack, fontWeight: FontWeight.bold, fontSize: 30, shadows: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4))
                  ])))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(transactionController.receipt.getCashIn.toString(), style: TextStyle(color: DpColors.mainBlack, fontWeight: FontWeight.bold, fontSize: 60, shadows: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4))
                  ])),
                    Text('Cash In', style: TextStyle(color: DpColors.mainBlack, fontWeight: FontWeight.bold, fontSize: 30, shadows: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4))
                  ]))
                  ],
                )
              ],
            ),
          )
            ],

          )),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(left: 50),
              child: Column(
                children: [
                  const SizedBox(
                height: 80
              ),
              Container(
                width: 600,
                height: 100,
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child:
              Text('Transaction complete.', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40, shadows: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4))
                  ]), textAlign:  TextAlign.center)
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: 200,
              height: 100,
              child: Ink(
                decoration: BoxDecoration(
                    color: DpColors.mainBlue,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 4,
                          offset: const Offset(0, 4))
                    ]),
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      SizedBox(
                        child: Text('Done',
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                      )
                    ],
                  ),
                  onTap: () {

                    Navigator.of(context).pushNamed('/kioskmain');
                  },
                ),
              ))
              

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}