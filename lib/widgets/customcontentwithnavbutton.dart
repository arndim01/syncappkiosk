import 'package:flutter/material.dart';

class CustomContentWithNavButton extends StatelessWidget {
  final Widget child;
  const CustomContentWithNavButton({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.center,
            child: Ink(
              width: 147,
              height: 262,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('./assets/imgs/back-bg.png'),
                      filterQuality: FilterQuality.medium,
                      fit: BoxFit.fill),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                child: const Icon(Icons.arrow_circle_left_outlined,
                    size: 110, color: Colors.white),
                onTap: () {},
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: child,
          ),
          Align(
            alignment: Alignment.center,
            child: Ink(
              width: 147,
              height: 262,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('./assets/imgs/ok-bg.png'),
                      filterQuality: FilterQuality.medium,
                      fit: BoxFit.fill),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                child: const Icon(Icons.arrow_circle_right_outlined,
                    size: 110, color: Colors.white),
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
