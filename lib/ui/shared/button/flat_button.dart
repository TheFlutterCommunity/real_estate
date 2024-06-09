import 'package:flutter/material.dart';

import '../../../core/index.dart';

class FlatButton extends StatefulWidget {
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final double? borderRadius;
  final bool isTextCenter;
  final Color? titleColor;
  final double? fontSize;
  final double? iconCircleHeight;
  final double? iconCircleWidth;
  final double? iconSize;
  final Color? iconBackgroundColor;
  final double? rightPadding;

  const FlatButton({
    this.height,
    this.width,
    this.backgroundColor,
    this.borderRadius,
    this.isTextCenter = false,
    this.titleColor,
    this.fontSize,
    this.iconCircleHeight,
    this.iconCircleWidth,
    this.iconSize,
    this.iconBackgroundColor,
    this.rightPadding,
    super.key,
  });

  @override
  State<FlatButton> createState() => _FlatButtonState();
}

class _FlatButtonState extends State<FlatButton> with TickerProviderStateMixin {
  /// Size Transition Animation Controller
  late final AnimationController _sizeTransitionController;

  /// Size Transition Animation
  late final Animation<double> _sizeTransitionAnimation;

  /// Size Transition Animation Align Status
  bool hasStartAlign = false;

  @override
  void initState() {
    super.initState();

    _sizeTransitionController = AnimationController(
      duration: const Duration(milliseconds: kAnimationDuration3000),
      vsync: this,
    )..forward();

    _sizeTransitionAnimation = CurvedAnimation(
      parent: _sizeTransitionController,
      curve: Curves.fastOutSlowIn,
    );

    Future.delayed(const Duration(milliseconds: kAnimationDuration300), () {
      if (mounted) {
        setState(() {
          hasStartAlign = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _sizeTransitionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _sizeTransitionAnimation,
      axis: Axis.horizontal,
      axisAlignment: -1,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(left: s4, right: s4, bottom: s4),
          child: Stack(
            children: [
              Container(
                height: widget.height ?? s11,
                width: widget.width ?? double.infinity,
                padding: EdgeInsets.only(left: s2, right: s2),
                alignment: widget.isTextCenter
                    ? Alignment.center
                    : Alignment.centerLeft,
                decoration: BoxDecoration(
                  gradient: flatButtonGradient,
                  borderRadius:
                      BorderRadius.circular(widget.borderRadius ?? s8),
                  color: widget.backgroundColor ?? whiteColor,
                ),
                child: Text(
                  kFlatName,
                  style: TextStyle(
                      color: widget.titleColor ?? textColor,
                      fontSize: widget.fontSize ?? addSizing(s3, half),
                      fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                height: widget.iconCircleHeight ?? s11,
                margin: EdgeInsets.only(left: half, right: half),
                child: AnimatedAlign(
                  alignment: hasStartAlign
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  duration:
                      const Duration(milliseconds: kAnimationDuration2500),
                  curve: Curves.fastOutSlowIn,
                  child: Container(
                    height: widget.iconCircleHeight ?? s11,
                    width: widget.iconCircleWidth ?? s10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.iconBackgroundColor ?? whiteColor,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: widget.iconSize ?? s2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
