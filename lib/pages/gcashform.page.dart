import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncappkiosk/widgets/inputform.widget.dart';
import '../controllers/transaction.controller.dart';
import '../helpers/dp_colors.dart';
import '../widgets/appheader.widget.dart';

class GCashFormPage extends StatefulWidget {
  const GCashFormPage({super.key});

  @override
  State<GCashFormPage> createState() => _GcashFormState();
}

class _GcashFormState extends State<GCashFormPage> {
  final transactionController = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    transactionController.accountController = TextEditingController(text: '09');

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
                      Navigator.of(context).pushNamed('/cashinservice');
                    },
                  ),
                ),
              ),
              InputForm(myController: transactionController.accountController),
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
                    onTap: () {
                      transactionController
                          .create(transactionController.accountController.text)
                          .then((value) {
                        transactionController.referenceNumber = value!;
                        Navigator.of(context).pushNamed('/creditform');
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
