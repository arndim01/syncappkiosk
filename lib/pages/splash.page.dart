import 'package:flutter/material.dart';

import '../helpers/dp_colors.dart';
import '../widgets/dplogo.widget.dart';

class SplashPage extends StatelessWidget {
  final int duration;
  final String goToPage;

  const SplashPage({super.key, this.duration = 0, this.goToPage = '/started'});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: duration), () {
      Navigator.of(context).pushNamed(goToPage);
    });

    return Scaffold(
      backgroundColor: DpColors.mainBG,
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.center,
            child: DpLogo(height: 170.23, width: 357),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 80),
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
