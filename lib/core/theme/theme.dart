import 'package:flutter/material.dart';

import '../index.dart';

ThemeData get appTheme => ThemeData(
      fontFamily: appFontEuclidCircularA,
    );

Gradient get orangeGradient => LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [floatSize0, floatSize20, floatSize50],
      colors: [
        whiteOrange1Color,
        whiteOrange2Color,
        whiteOrange3Color,
      ],
    );

Gradient get flatButtonGradient => LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [floatSizeMinus90, floatSize40, floatSize20],
      colors: [
        whiteOrange1Color,
        sliderContainer2Color,
        sliderContainer3Color,
      ],
    );
