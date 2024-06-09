import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/index.dart';

class SvgOnImage extends StatelessWidget {
  final String iconPath;

  const SvgOnImage({
    super.key,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(s6),
      decoration: BoxDecoration(
        color: yellowColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(s6),
          topRight: Radius.circular(s6),
          bottomLeft: Radius.circular(s0),
          bottomRight: Radius.circular(s6),
        ),
      ),
      child: SvgPicture.asset(
        iconPath,
        height: s12,
        width: s12,
        colorFilter: ColorFilter.mode(
          whiteColor,
          BlendMode.srcIn,
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
