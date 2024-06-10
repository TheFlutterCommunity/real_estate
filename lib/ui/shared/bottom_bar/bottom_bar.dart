import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/index.dart';

class BottomBar extends StatefulWidget {
  final double? width;
  final int tabIndex;
  final List<TabItem> tabItems;
  final Function(int) onTap;

  const BottomBar({
    this.width,
    required this.tabIndex,
    required this.tabItems,
    required this.onTap,
    super.key,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with TickerProviderStateMixin {
  /// BottomBar Animation Controller
  late final AnimationController bottomBarAnimationController;

  @override
  void initState() {
    super.initState();

    bottomBarAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: kAnimationDuration2500));

    /// Init Animations
    _initAnimations();
  }

  void _initAnimations() {
    bottomBarAnimationController.forward();
  }

  @override
  void dispose() {
    bottomBarAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(s0, base), end: Offset.zero)
          .animate(bottomBarAnimationController),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: s14,
          width: widget.width ?? double.infinity,
          margin: EdgeInsets.only(left: s4),
          padding: EdgeInsets.only(left: s1, right: s1),
          decoration: BoxDecoration(
            color: tabBarBgColor,
            borderRadius: BorderRadius.circular(s12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: widget.tabItems
                .map(
                  (item) => _TabBarItem(
                    index: widget.tabItems.indexOf(item),
                    isSelected:
                        widget.tabItems.indexOf(item) == widget.tabIndex,
                    tabItem: item,
                    onTap: widget.onTap,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class _TabBarItem extends StatelessWidget {
  final TabItem tabItem;
  final Function(int) onTap;
  final bool isSelected;
  final int index;

  const _TabBarItem({
    required this.tabItem,
    required this.onTap,
    this.isSelected = false,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => onTap(index),
      elevation: base,
      constraints: const BoxConstraints(),
      shape: const CircleBorder(),
      fillColor: isSelected ? yellowDarkColor : tabItemBgColor,
      splashColor: whiteColor,
      highlightColor: whiteColor.withOpacity(floatSize60),
      child: AnimatedContainer(
        height: isSelected ? s12 : s9,
        width: isSelected ? s12 : s9,
        duration: const Duration(milliseconds: kAnimationDuration500),
        child: Center(
          child: SvgPicture.asset(
            tabItem.iconPath,
            height: addSizing(s4, half),
            width: addSizing(s4, half),
            colorFilter: ColorFilter.mode(whiteColor, BlendMode.srcIn),
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
