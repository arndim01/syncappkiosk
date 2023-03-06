import 'package:flutter/material.dart';

import '../helpers/dp_colors.dart';
import '../widgets/servicelist.widget.dart';
import '../widgets/appheader.widget.dart';

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
