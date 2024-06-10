import 'package:flutter/material.dart';

import '../../../core/index.dart';
import '../../index.dart';

class StatsSection extends StatefulWidget {
  const StatsSection({super.key});

  @override
  State<StatsSection> createState() => _StatsSectionState();
}

class _StatsSectionState extends State<StatsSection>
    with TickerProviderStateMixin {
  /// Scale Transition Animation Controller
  late final AnimationController _scaleTransitionAnimationController;

  /// Scale Transition Animation
  late final Animation<double> _scaleTransitionAnimation;

  @override
  void initState() {
    super.initState();

    _scaleTransitionAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: kAnimationDuration1500),
    );

    _scaleTransitionAnimation = CurvedAnimation(
      parent: _scaleTransitionAnimationController,
      curve: Curves.fastOutSlowIn,
    );
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: kAnimationDuration1200), () {
      if (mounted) {
        _scaleTransitionAnimationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _scaleTransitionAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: s4, right: s4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ScaleTransition(
            scale: _scaleTransitionAnimation,
            child: Container(
              height: width * floatSize45,
              width: width * floatSize45,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: yellowDarkColor,
              ),
              child: Padding(
                padding: EdgeInsets.all(s5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      kBuy.toUpperCase(),
                      style: TextStyle(
                        color: stats1LabelTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: s4,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedDigit(
                            key: UniqueKey(),
                            delayDuration: const Duration(
                                milliseconds: kAnimationDuration1200),
                            duration: const Duration(
                                milliseconds: kAnimationDuration1500),
                            digit: kBuyCountNo,
                            style: TextStyle(
                              color: stats1LabelTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: s10,
                            ),
                          ),
                          Text(
                            kOffers,
                            style: TextStyle(
                              color: stats1LabelTextColor,
                              fontWeight: FontWeight.w400,
                              fontSize: s4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          ScaleTransition(
            scale: _scaleTransitionAnimation,
            child: Container(
              height: width * floatSize45,
              width: width * floatSize45,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(s6),
                  color: offWhiteColor),
              child: Padding(
                padding: EdgeInsets.all(s5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      kRent.toUpperCase(),
                      style: TextStyle(
                        color: stats2LabelTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: s4,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedDigit(
                            key: UniqueKey(),
                            delayDuration: const Duration(
                                milliseconds: kAnimationDuration1200),
                            duration: const Duration(
                              milliseconds: kAnimationDuration1500,
                            ),
                            digit: kRentCountNo,
                            style: TextStyle(
                              color: stats2LabelTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: s10,
                            ),
                          ),
                          Text(
                            kOffers,
                            style: TextStyle(
                              color: stats2LabelTextColor,
                              fontWeight: FontWeight.w400,
                              fontSize: s4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
