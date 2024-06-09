import 'package:flutter/material.dart';
import 'package:real_estate/core/index.dart';

Future<Object?> showNewDialog<T>({
  required BuildContext context,
  bool barrierDismissible = true,
  Widget? child,
  required WidgetBuilder builder,
}) {
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = child ?? Builder(builder: builder);
      return Builder(builder: (BuildContext context) {
        return pageChild;
      });
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: popupBackgroundTransparentColor,
    transitionDuration: const Duration(milliseconds: kAnimationDuration800),
    transitionBuilder: _buildNewTransition,
  );
}

Widget _buildNewTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}
