import 'package:flutter/material.dart';

class IconElevationButtonAtom extends StatelessWidget {
  const IconElevationButtonAtom({
    super.key,
    this.onPressed,
    required this.icon,
  });

  final void Function()? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 2.0,
      borderRadius: BorderRadius.circular(16.0),
      child: IconButton(
          color: Colors.black,
          style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
              )),
          onPressed: onPressed,
          icon: Icon(icon)),
    );
  }
}
