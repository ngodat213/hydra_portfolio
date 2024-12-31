import 'package:flutter/material.dart';
import 'package:hydra_profolio/utils/responsive_layout.dart';
import 'widgets/resume_desktop.content.dart';
import 'widgets/resume_mobile.content.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ResponsiveWidget(
          mobile: ResumeMobileContent(),
          desktop: ResumeDesktopContent(),
        ),
      ),
    );
  }
}
