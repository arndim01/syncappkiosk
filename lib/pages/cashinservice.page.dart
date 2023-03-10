import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/transaction.controller.dart';
import '../helpers/dp_colors.dart';
import '../widgets/appheader.widget.dart';
import '../widgets/cashinlist.widget.dart';
import '../widgets/contentwithnavbutton.widget.dart';

class CashInServicePage extends StatelessWidget {
  const CashInServicePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DpColors.mainBG,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppHeader(),
          CustomContentWithNavButton(
            goBack: '/kioskmain',
            hasGoto: false,
            child: const CashInList(),
          )
        ],
      ),
    );
  }
}
