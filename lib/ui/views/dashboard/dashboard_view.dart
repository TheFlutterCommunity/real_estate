import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:real_estate/ui/index.dart';

import '../../../core/index.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  /// Add get it and register store
  late final DashboardStore dashboardStore;

  /// Tab Items
  final List<TabItem> tabItems = <TabItem>[];

  /// Pages
  final List<Widget> _pages = <Widget>[];

  @override
  void initState() {
    super.initState();

    dashboardStore = locator<DashboardStore>();

    tabItems.addAll([
      TabItem(title: kSearch, iconPath: searchFilled),
      TabItem(title: kChat, iconPath: chat),
      TabItem(title: kHome, iconPath: home),
      TabItem(title: kFavourite, iconPath: favourite),
      TabItem(title: kProfile, iconPath: profile),
    ]);

    _pages.addAll([
      const SearchView(),
      const ChatView(),
      const HomeView(),
      const FavouriteView(),
      const ProfileView(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) => Scaffold(
        body: _pages.elementAt(dashboardStore.tabIndex.value),
        floatingActionButton: BottomBar(
          width: MediaQuery.of(context).size.width * floatSize68,
          onTap: (index) => dashboardStore.selectTab(index),
          tabIndex: dashboardStore.tabIndex.value,
          tabItems: tabItems,
        ),
      ),
    );
  }
}
