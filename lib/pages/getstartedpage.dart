import 'package:flutter/material.dart';
import 'package:syncappkiosk/helpers/dp_colors.dart';
import 'package:syncappkiosk/widgets/dplogo.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DpColors.mainBG,
        body: Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: DpLogo(height: 110.23, width: 257),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 80),
                child: Ink(
                  decoration: BoxDecoration(
                      color: DpColors.mainBlue,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 4,
                            offset: const Offset(0, 4))
                      ]),
                  child: InkWell(
                    child: Container(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 20, left: 40, right: 40),
                        child: const Text('Get Started',
                            style:
                                TextStyle(color: Colors.white, fontSize: 32))),
                    onTap: () {
                      Navigator.of(context).pushNamed('/kioskmain');
                    },
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
