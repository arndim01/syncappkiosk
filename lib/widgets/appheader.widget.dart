import 'package:flutter/material.dart';

import '../helpers/dp_colors.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // const DpLogo(height: 50, width: 110),
          const SizedBox(),
          Container(
              padding: const EdgeInsets.all(10),
              width: 200,
              height: 100,
              child: Ink(
                decoration: BoxDecoration(
                    color: DpColors.mainRed,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      SizedBox(
                        child: Icon(
                          Icons.contact_support_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      SizedBox(
                        child: Text('Help',
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                      )
                    ],
                  ),
                  onTap: () {},
                ),
              ))
        ],
      ),
    );
  }
}
