import 'package:flutter/material.dart';

import '../../../core/index.dart';

class TitleSection extends StatefulWidget {
  const TitleSection({super.key});

  @override
  State<TitleSection> createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection>
    with TickerProviderStateMixin {
  /// Scale Transition Animation Controller
  late final AnimationController _fadeTransitionAnimationController;

  /// Size Transition Animation Controller
  late final AnimationController _sizeTransitionController;

  /// Scale Transition Animation
  late final Animation<double> _fadeTransitionAnimation;

  /// Size Transition Animation
  late final Animation<double> _sizeTransitionAnimation;

  @override
  void initState() {
    super.initState();

    _fadeTransitionAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: kAnimationDuration800))
      ..forward();
    _sizeTransitionController = AnimationController(
      duration: const Duration(milliseconds: kAnimationDuration1500),
      vsync: this,
    )..forward();

    _fadeTransitionAnimation = CurvedAnimation(
      parent: _fadeTransitionAnimationController,
      curve: Curves.easeIn,
    );

    _sizeTransitionAnimation = CurvedAnimation(
      parent: _sizeTransitionController,
      curve: Curves.decelerate,
    );
  }

  @override
  void dispose() {
    _fadeTransitionAnimationController.dispose();
    _sizeTransitionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: s4, right: s4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeTransition(
            opacity: _fadeTransitionAnimation,
            child: Text(
              kUserWelcomeMessage,
              style: TextStyle(
                color: titleTextColor,
                fontWeight: FontWeight.w400,
                fontSize: s5,
              ),
            ),
          ),
          SizeTransition(
            sizeFactor: _sizeTransitionAnimation,
            axis: Axis.vertical,
            axisAlignment: -1,
            child: Text(
              kDescription,
              style: TextStyle(
                color: descTextColor,
                fontWeight: FontWeight.w400,
                fontSize: addSizing(s9, half),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
