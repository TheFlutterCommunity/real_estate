import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/index.dart';
import '../../index.dart';

class SearchBottomSection extends StatelessWidget {
  const SearchBottomSection({super.key});

  void showMapMenu(BuildContext context) {
    showNewDialog(
      context: context,
      builder: (BuildContext context) {
        return const PopUpMenu();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: s22,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          left: s7,
          top: s2,
          right: s7,
          bottom: s2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RawMaterialButton(
              onPressed: () => showMapMenu(context),
              elevation: base,
              constraints: const BoxConstraints(),
              splashColor: whiteColor,
              fillColor: fabBackgroundColor.withOpacity(borderRadius80),
              shape: const CircleBorder(),
              highlightColor: whiteColor.withOpacity(floatSize60),
              child: AnimatedContainer(
                height: s10,
                width: s10,
                duration: const Duration(milliseconds: kAnimationDuration500),
                child: Center(
                  child: SvgPicture.asset(
                    layer,
                    height: s4,
                    width: s4,
                    colorFilter:
                        ColorFilter.mode(darkTitleTextColor, BlendMode.srcIn),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RawMaterialButton(
                  onPressed: () {
                    //TODO: Not Implemented
                  },
                  elevation: base,
                  constraints: const BoxConstraints(),
                  splashColor: whiteColor,
                  fillColor: fabBackgroundColor.withOpacity(borderRadius80),
                  shape: const CircleBorder(),
                  highlightColor: whiteColor.withOpacity(floatSize60),
                  child: AnimatedContainer(
                    height: s10,
                    width: s10,
                    duration:
                        const Duration(milliseconds: kAnimationDuration500),
                    child: Center(
                      child: SvgPicture.asset(
                        navigation,
                        height: s4,
                        width: s4,
                        colorFilter: ColorFilter.mode(
                            darkTitleTextColor, BlendMode.srcIn),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    //TODO: Not Implemented
                  },
                  elevation: base,
                  constraints: const BoxConstraints(),
                  shape: const RoundedRectangleBorder(),
                  child: AnimatedContainer(
                    height: s10,
                    padding: EdgeInsets.only(left: s4, right: s4),
                    duration:
                        const Duration(milliseconds: kAnimationDuration500),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(s6),
                      color: fabBackgroundColor.withOpacity(borderRadius90),
                    ),
                    child: Row(
                      children: [
                        Center(
                          child: SvgPicture.asset(
                            list,
                            height: s4,
                            width: s4,
                            colorFilter: ColorFilter.mode(
                                darkTitleTextColor, BlendMode.srcIn),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        SizedBox(width: s2),
                        Text(
                          kListVariants,
                          style: TextStyle(
                            color: darkTitleTextColor,
                            fontSize: s3,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
