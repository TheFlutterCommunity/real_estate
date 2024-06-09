import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:real_estate/core/model/grid_item.dart';

import '../../../core/index.dart';
import '../../index.dart';

class FlatSection extends StatefulWidget {
  const FlatSection({super.key});

  @override
  State<FlatSection> createState() => _FlatSectionState();
}

class _FlatSectionState extends State<FlatSection>
    with TickerProviderStateMixin {
  final List<GridItem> items = <GridItem>[];

  /// BottomBar Animation Controller
  late final AnimationController _flatSectionAnimationController;

  @override
  void initState() {
    super.initState();

    items.addAll([
      GridItem(
        size: StaggeredGridSize.fullWidth,
        title: kFlatName,
        imagePath: imgHotel1,
      ),
      GridItem(
        size: StaggeredGridSize.halfWidthFullHeight,
        title: kFlatName,
        imagePath: imgHotel4,
      ),
      GridItem(
        size: StaggeredGridSize.halfWidthHalfHeight,
        title: kFlatName,
        imagePath: imgHotel3,
      ),
      GridItem(
        size: StaggeredGridSize.halfWidthHalfHeight,
        title: kFlatName,
        imagePath: imgHotel3,
      ),
    ]);

    _flatSectionAnimationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: kAnimationDuration2000));

    /// Init Animations
    _initAnimations();
  }

  void _initAnimations() {
    _flatSectionAnimationController.forward();
  }

  @override
  void dispose() {
    _flatSectionAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
          .animate(_flatSectionAnimationController),
      child: Card(
        color: whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(s8),
            topRight: Radius.circular(s8),
            bottomLeft: Radius.circular(s4),
            bottomRight: Radius.circular(s4),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: multipleSizing(quarter, half),
            top: s2,
            right: multipleSizing(quarter, half),
            bottom: s2,
          ),
          child: StaggeredGrid.count(
            crossAxisCount: items.length,
            mainAxisSpacing: s2,
            crossAxisSpacing: s2,
            children: items.map((item) {
              Widget child;
              int crossAxisCellCount;
              num mainAxisCellCount;
              if (item.size == StaggeredGridSize.fullWidth) {
                crossAxisCellCount = kStaggeredCount4;
                mainAxisCellCount = kStaggeredCount2;
                child = const FullWidthTile();
              } else if (item.size == StaggeredGridSize.halfWidthFullHeight) {
                crossAxisCellCount = kStaggeredCount2;
                mainAxisCellCount = kStaggeredCount3;
                child = const HalfWidthFullHeightTile();
              } else if (item.size == StaggeredGridSize.halfWidthHalfHeight) {
                crossAxisCellCount = kStaggeredCount2;
                mainAxisCellCount = kStaggeredCount1_2;
                child = const HalfWidthHalfHeightTile();
              } else {
                crossAxisCellCount = kStaggeredCount4;
                mainAxisCellCount = kStaggeredCount1_2;
                child = const Empty();
              }
              return StaggeredGridTile.count(
                crossAxisCellCount: crossAxisCellCount,
                mainAxisCellCount: mainAxisCellCount,
                child: child,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
