import 'package:flutter/material.dart';
import 'package:hydra_profolio/models/resume.dart';
import 'package:hydra_profolio/screens/home_screen/widgets/home_desktop.content.dart';
import 'package:hydra_profolio/screens/home_screen/widgets/home_mobile.content.dart';
import 'package:hydra_profolio/services/resume_service.dart';
import '../../utils/responsive_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Resume>(
      future: ResumeService.getResume(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final resume = snapshot.data!;
        return ResponsiveWidget(
          mobile: const HomeMobileContent(),
          desktop: HomeDesktopContent(resume: resume),
        );
      },
    );
  }
}
