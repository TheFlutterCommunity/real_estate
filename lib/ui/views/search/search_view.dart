import 'package:flutter/material.dart';
import 'package:real_estate/core/index.dart';
import '../index.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textColor,
      body: const Stack(
        children: <Widget>[
          SearchMap(),
          SearchBottomSection(),
          SearchHeaderSection()
        ],
      ),
    );
  }
}
