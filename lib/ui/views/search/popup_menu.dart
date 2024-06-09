import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/index.dart';

class PopUpMenu extends StatefulWidget {
  const PopUpMenu({super.key});

  @override
  State<PopUpMenu> createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  /// Dashboard Store
  late final DashboardStore dashboardStore;

  /// Popup Items
  final List<TabItem> popupItems = <TabItem>[];

  @override
  void initState() {
    super.initState();

    dashboardStore = locator<DashboardStore>();

    popupItems.addAll([
      TabItem(title: kCosyAreas, iconPath: secure),
      TabItem(title: kPrice, iconPath: wallet),
      TabItem(title: kInfrastructure, iconPath: recycle),
      TabItem(title: kWithoutAnyLayer, iconPath: layer),
    ]);
  }

  Widget _buildPopUpItem(TabItem item, {required Function(int) onTap}) {
    final dashboardStore = locator<DashboardStore>();
    final index = popupItems.indexOf(item);
    bool isSelected = dashboardStore.popUpItemIndex.value == index;
    return InkWell(
      onTap: () => onTap(index),
      child: Container(
        padding: EdgeInsets.only(top: s2, bottom: s2),
        child: Row(
          children: [
            Center(
              child: SvgPicture.asset(
                item.iconPath,
                height: addSizing(s4, s1),
                width: addSizing(s4, s1),
                colorFilter: ColorFilter.mode(
                  isSelected ? yellowDarkColor : popUpItemTextColor,
                  BlendMode.srcIn,
                ),
                fit: BoxFit.scaleDown,
              ),
            ),
            SizedBox(
              width: s2,
            ),
            Text(
              item.title,
              style: TextStyle(
                color: isSelected ? yellowDarkColor : popUpItemTextColor,
                fontSize: addSizing(s3, half),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) => Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          height: kPopupHeight,
          width: kPopupWidth,
          margin: EdgeInsets.only(left: s8, bottom: addSizing(s30, s8)),
          padding: EdgeInsets.only(left: s4, top: s4, right: s4, bottom: s4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(s5),
              color: popupBackgroundColor),
          child: Material(
            color: popupBackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: popupItems
                  .map((popUpItem) =>
                      _buildPopUpItem(popUpItem, onTap: (int index) {
                        dashboardStore.selectPopUpItem(index);
                      }))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
