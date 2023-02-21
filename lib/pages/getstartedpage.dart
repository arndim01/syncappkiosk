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
              child: DpLogo(height: 170.23, width: 387),
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
                    customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: const SizedBox(
                        width: 272,
                        height: 86,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontSize: 45),
                              textAlign: TextAlign.center,
                            ))),
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
