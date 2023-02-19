import 'package:flutter/material.dart';
import 'package:syncappkiosk/helpers/dp_colors.dart';
import 'package:syncappkiosk/widgets/servicelist.dart';
import 'package:syncappkiosk/widgets/appheader.dart';

class KioskMainPage extends StatelessWidget {
  const KioskMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DpColors.mainBG,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppHeader(),
          Row(
            children: const [ServiceList()],
          )
        ],
      ),
    );
  }
}
