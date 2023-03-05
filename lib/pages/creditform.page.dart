import 'package:flutter/material.dart';
import '../widgets/creditform.widget.dart';
import '../helpers/dp_colors.dart';
import '../widgets/appheader.widget.dart';
import '../widgets/contentwithnavbutton.widget.dart';

class CreditFormPage extends StatelessWidget {
  const CreditFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DpColors.mainBG,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AppHeader(),
          CustomContentWithNavButton(
              goBack: '/cashinservice',
              child: CreditForm())
        ],
      ),
    );
  }

}