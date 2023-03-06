import 'package:flutter/material.dart';

class CustomContentWithNavButton extends StatelessWidget {
  final Widget child;
  final String goBack;
  final String goTo;
  final bool hasGoback;
  final bool hasGoto;
  const CustomContentWithNavButton(
      {super.key,
      this.goBack = '/started',
      this.goTo = '/started',
      this.hasGoback = true,
      this.hasGoto = true,
      required this.child});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if( hasGoback)  Align(
            alignment: Alignment.center,
            child: Ink(
              width: 180,
              height: 350,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('./assets/imgs/back-bg.png'),
                      filterQuality: FilterQuality.medium,
                      fit: BoxFit.fill),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                customBorder: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(300),
                        bottomRight: Radius.circular(300))),
                child: const Icon(Icons.arrow_circle_left_outlined,
                    size: 140, color: Colors.white),
                onTap: () {
                  Navigator.of(context).pushNamed(goBack);
                },
              ),
            ),
          ) else const SizedBox( width: 260),

          Align(
            alignment: Alignment.center,
            child: child,
          ),
          if( hasGoto ) Align(
            alignment: Alignment.center,
            child: Ink(
              width: 180,
              height: 350,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('./assets/imgs/ok-bg.png'),
                      filterQuality: FilterQuality.medium,
                      fit: BoxFit.fill),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                customBorder: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(300),
                        bottomLeft: Radius.circular(300))),
                child: const Icon(Icons.arrow_circle_right_outlined,
                    size: 140, color: Colors.white),
                onTap: () {
                  Navigator.of(context).pushNamed(goTo);
                },
              ),
            ),
          ) else const SizedBox( width: 260),
        ],
      ),
    );
  }
}
