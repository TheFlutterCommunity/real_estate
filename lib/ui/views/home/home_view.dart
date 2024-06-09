import 'package:flutter/material.dart';
import 'package:real_estate/ui/index.dart';
import '../../../core/index.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: orangeGradient),
        padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
        child: Column(
          children: [
            HomeHeader(height: s20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: s4),
                    const TitleSection(),
                    SizedBox(height: s10),
                    const StatsSection(),
                    SizedBox(height: s10),
                    const FlatSection(),
                    SizedBox(height: s20)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
