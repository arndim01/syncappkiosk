import 'package:flutter/material.dart';

class CashInList extends StatelessWidget {
  const CashInList({super.key});

  @override
  Widget build(BuildContext context) {
    return Ink(
        child: InkWell(
      customBorder:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('./assets/imgs/gcash.png',
                  width: 350, height: 250, filterQuality: FilterQuality.medium),
            ),
          ),
          SizedBox(
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Cash In',
                  style: TextStyle(color: Colors.white, fontSize: 50, shadows: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4))
                  ]),
                  textAlign: TextAlign.center,
                )),
          )
        ],
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/gcashform');
      },
    ));
  }
}
