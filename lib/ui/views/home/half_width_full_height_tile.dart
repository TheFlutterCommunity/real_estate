import 'package:flutter/material.dart';

import '../../../core/index.dart';
import '../../index.dart';

class HalfWidthFullHeightTile extends StatelessWidget {
  const HalfWidthFullHeightTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(s4),
            child: Image.asset(
              imgHotel4,
              fit: BoxFit.cover,
            ),
          ),
        ),
        FlatButton(
          height: s9,
          rightPadding: half,
          iconCircleHeight: s9,
          iconCircleWidth: s8,
        )
      ],
    );
  }
}
