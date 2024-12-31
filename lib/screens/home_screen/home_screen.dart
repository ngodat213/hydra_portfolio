import 'package:flutter/material.dart';
import 'package:hydra_profolio/screens/home_screen/widgets/home_desktop.content.dart';
import 'package:hydra_profolio/screens/home_screen/widgets/home_mobile.content.dart';
import '../../utils/responsive_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: ResponsiveWidget(
        mobile: HomeMobileContent(),
        desktop: HomeDesktopContent(),
      ),
    );
  }
}
