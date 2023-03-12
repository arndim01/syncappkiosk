import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
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
    bool _isLoaderVisible = false;
  
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
                    onTap: () async {
                      context.loaderOverlay.show();                
                      if( transactionController.accountController.text.toString().length != 11 ){

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
                                              'Invalid account number.',
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
                                  context.loaderOverlay.hide(); 
                      }else{
                        await transactionController.create(transactionController.accountController.text)
                        .then((value){
                          transactionController.referenceNumber = value!;
                          transactionController.setTransactionDetails(value, transactionController.accountController.text);
                          context.loaderOverlay.hide();
                          Navigator.of(context).pushNamed('/creditform');
                        }).onError((error, stackTrace) {
                          context.loaderOverlay.hide();
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
                                              'Failed to communicate.',
                                              style: TextStyle(fontSize: 50)),
                                          Text(
                                              'Please contact the admin.',
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
                        });
                      }
                      
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
