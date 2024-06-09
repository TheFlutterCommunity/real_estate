import 'package:flutter/material.dart';

import '../../../core/index.dart';
import '../../index.dart';

class FullWidthTile extends StatelessWidget {
  const FullWidthTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(s6),
            child: Image.asset(
              imgHotel1,
              fit: BoxFit.cover,
            ),
          ),
        ),
        FlatButton(
          height: s11,
          rightPadding: quarter,
          iconCircleHeight: s11,
          iconCircleWidth: s10,
          isTextCenter: true,
        )
      ],
    );
  }
}
