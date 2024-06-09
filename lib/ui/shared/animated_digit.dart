import 'package:flutter/material.dart';
import 'package:real_estate/core/index.dart';

class AnimatedDigit extends StatefulWidget {
  final num digit;
  final Duration duration;
  final TextStyle style;

  const AnimatedDigit({
    required Key key,
    required this.digit,
    this.duration = const Duration(milliseconds: kAnimationDuration1200),
    required this.style,
  }) : super(key: key);

  @override
  State<AnimatedDigit> createState() => _AnimatedDigitState();
}

class _AnimatedDigitState extends State<AnimatedDigit>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late double displayDigit;

  @override
  void initState() {
    super.initState();

    displayDigit = widget.digit.toDouble();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(begin: floatSize0, end: floatSize100).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void didUpdateWidget(AnimatedDigit oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.digit != widget.digit) {
      _animationController.reset();
      _animationController.forward(from: floatSize0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.addListener(() {
      setState(() {
        displayDigit = double.parse(widget.digit.toStringAsFixed(2));
      });
    });

    final animatedValue = displayDigit * _animation.value;

    final text = animatedValue.toString().split('.')[0];
    String? finalValue;
    if (text.length > 3) {
      finalValue = text.substring(1, text.length);
      finalValue = '${text[0]} $finalValue';
    }

    return Text(
      finalValue ?? text,
      style: widget.style.copyWith(
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
