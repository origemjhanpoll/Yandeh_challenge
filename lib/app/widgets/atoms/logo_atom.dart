import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoAtom extends StatelessWidget {
  const LogoAtom({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/logofill.svg',
      width: 160,
    );
  }
}
