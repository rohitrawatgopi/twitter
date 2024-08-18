import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 100,
      child: SvgPicture.asset(
        "assets/logo.svg",
        color: Colors.blue,
      ),
    );
  }
}
