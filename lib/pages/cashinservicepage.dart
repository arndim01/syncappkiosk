import 'package:flutter/material.dart';
import 'package:syncappkiosk/helpers/dp_colors.dart';
import 'package:syncappkiosk/widgets/appheader.dart';

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
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: const [
              Align(
                alignment: Alignment.centerLeft,
                child: Text('test1'),
              ),
              Align(
                alignment: Alignment.center,
                child: Text('center'),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text('test2'),
              )
            ],
          )
        ],
      ),
    );
  }
}
