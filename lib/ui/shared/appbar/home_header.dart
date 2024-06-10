import 'package:flutter/material.dart';

import '../../../core/index.dart';

class HomeHeader extends StatefulWidget {
  final String? address;
  final double height;

  const HomeHeader({this.address, this.height = kAppBarHeight, super.key});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> with TickerProviderStateMixin {
  /// Scale Transition Animation Controller
  late final AnimationController _scaleTransitionAnimationController;

  /// Size Transition Animation Controller
  late final AnimationController _sizeTransitionController;

  /// Scale Transition Animation
  late final Animation<double> _scaleTransitionAnimation;

  /// Size Transition Animation
  late final Animation<double> _sizeTransitionAnimation;

  @override
  void initState() {
    super.initState();

    _scaleTransitionAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: kAnimationDuration1500))
      ..forward();
    _sizeTransitionController = AnimationController(
      duration: const Duration(milliseconds: kAnimationDuration1500),
      vsync: this,
    )..forward();

    _scaleTransitionAnimation = CurvedAnimation(
      parent: _scaleTransitionAnimationController,
      curve: Curves.fastOutSlowIn,
    );
    _sizeTransitionAnimation = CurvedAnimation(
      parent: _sizeTransitionController,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _scaleTransitionAnimationController.dispose();
    _sizeTransitionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: EdgeInsets.symmetric(horizontal: s4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizeTransition(
            sizeFactor: _sizeTransitionAnimation,
            axis: Axis.horizontal,
            axisAlignment: floatSizeMinusOne,
            child: Center(
              child: Container(
                padding: EdgeInsets.only(left: s4, right: s4),
                height: s10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(s2),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: brownColor,
                      size: s4,
                    ),
                    SizedBox(width: s1),
                    Text(
                      kAddress,
                      style: TextStyle(
                        fontSize: addSizing(s3, half),
                        color: brownTextColor,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ScaleTransition(
            scale: _scaleTransitionAnimation,
            child: CircleAvatar(
              backgroundImage: const AssetImage(imgProfile),
              backgroundColor: yellowColor,
              radius: s6,
            ),
          )
        ],
      ),
    );
  }
}
