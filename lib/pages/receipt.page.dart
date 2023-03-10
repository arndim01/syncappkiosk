import 'package:flutter/material.dart';
import 'package:syncappkiosk/helpers/dp_colors.dart';
import 'package:syncappkiosk/widgets/appheader.widget.dart';

import '../widgets/dplogo.widget.dart';

class ReceiptPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DpColors.mainBG,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppHeader(),
          ],
        ));
  }
}
