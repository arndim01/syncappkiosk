import 'package:flutter/material.dart';
import 'package:syncappkiosk/widgets/inputform.dart';

import '../helpers/dp_colors.dart';
import '../widgets/appheader.dart';
import '../widgets/customcontentwithnavbutton.dart';

class GCashFormPage extends StatelessWidget {
  const GCashFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DpColors.mainBG,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AppHeader(),
          CustomContentWithNavButton(
              goBack: '/cashinservice', child: InputForm())
        ],
      ),
    );
  }
}
