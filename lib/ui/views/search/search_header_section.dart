import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/index.dart';

class SearchHeaderSection extends StatefulWidget {
  const SearchHeaderSection({super.key});

  @override
  State<SearchHeaderSection> createState() => _SearchHeaderSectionState();
}

class _SearchHeaderSectionState extends State<SearchHeaderSection>
    with TickerProviderStateMixin {
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
      curve: Curves.easeOutQuint,
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
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: s11,
      width: width,
      margin: EdgeInsets.only(
        left: s7,
        top: s14,
        right: s7,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizeTransition(
            sizeFactor: _sizeTransitionAnimation,
            axis: Axis.horizontal,
            axisAlignment: -2,
            child: SizedBox(
              width: width * 0.75,
              child: TextField(
                showCursor: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: s4),
                  hintText: kMapAddress,
                  hintStyle: TextStyle(
                    color: textColor,
                    fontSize: addSizing(s3, half),
                  ),
                  filled: true,
                  fillColor: whiteColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(s10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: SvgPicture.asset(
                    search,
                    height: s4,
                    width: s4,
                    colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ),
          ScaleTransition(
            scale: _scaleTransitionAnimation,
            child: SizedBox(
              width: s11,
              child: RawMaterialButton(
                onPressed: () {
                  //TODO: Not Implemented
                },
                elevation: base,
                constraints: const BoxConstraints(),
                splashColor: offWhiteColor,
                fillColor: whiteColor,
                shape: const CircleBorder(),
                highlightColor: offWhiteColor,
                child: AnimatedContainer(
                  height: s11,
                  width: s11,
                  duration: const Duration(milliseconds: kAnimationDuration500),
                  child: Center(
                    child: SvgPicture.asset(
                      setting,
                      height: s4,
                      width: s4,
                      colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
