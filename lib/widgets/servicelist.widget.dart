import 'package:flutter/material.dart';
import 'package:syncappkiosk/helpers/dp_colors.dart';

class ServiceList extends StatelessWidget {
  const ServiceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 40),
      child: Ink(
        child: InkWell(
          customBorder:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: 250,
                  height: 200,
                  padding: const EdgeInsets.only(
                      top: 10, left: 30, right: 30, bottom: 10),
                  decoration: BoxDecoration(
                      color: DpColors.mainBlue,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 4,
                            offset: const Offset(0, 4))
                      ]),
                  child: const Icon(
                    Icons.money_outlined,
                    color: Colors.white,
                    size: 100,
                  ),
                ),
                SizedBox(
                  height: 90,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Cash In',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 55,
                          shadows: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 4,
                                offset: const Offset(0, 4))
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            Navigator.of(context).pushNamed('/cashinservice');
          },
        ),
      ),
    );
  }
}
