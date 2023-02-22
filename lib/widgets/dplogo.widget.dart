import 'package:flutter/material.dart';

class DpLogo extends StatefulWidget {
  final double height;
  final double width;

  const DpLogo({super.key, this.height = 0, this.width = 0});

  @override
  State<DpLogo> createState() => _DpLogoState();
}

class _DpLogoState extends State<DpLogo> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        './assets/imgs/deeploy-logo-v3.png',
        fit: BoxFit.fill,
        width: widget.width,
        height: widget.height,
        filterQuality: FilterQuality.medium,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
