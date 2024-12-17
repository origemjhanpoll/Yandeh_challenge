import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoAtom extends StatelessWidget {
  const LogoAtom({super.key, required this.asset, this.width, this.height});
  final String asset;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      width: width,
      height: height,
    );
  }
}
