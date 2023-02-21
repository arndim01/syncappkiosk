import 'package:flutter/material.dart';
import 'package:syncappkiosk/helpers/dp_colors.dart';
import 'package:syncappkiosk/widgets/appheader.dart';
import 'package:syncappkiosk/widgets/cashinlist.dart';
import 'package:syncappkiosk/widgets/customcontentwithnavbutton.dart';

class CashInServicePage extends StatelessWidget {
  const CashInServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DpColors.mainBG,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AppHeader(),
          CustomContentWithNavButton(
            goBack: '/kioskmain',
            goTo: '/gcashform',
            child: CashInList(),
          )
        ],
      ),
    );
  }
}
