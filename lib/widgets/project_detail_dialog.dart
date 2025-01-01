import 'package:flutter/material.dart';
import 'package:hydra_profolio/models/resume.dart';
import 'package:hydra_profolio/theme/app_theme.dart';
import 'package:hydra_profolio/utils/responsive_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailDialog extends StatelessWidget {
  final Project project;

  const ProjectDetailDialog({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: isDesktop ? 1200 : MediaQuery.of(context).size.width * 0.9,
          maxHeight: isDesktop ? 800 : MediaQuery.of(context).size.height * 0.9,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Hero Image Section with Gradient Overlay
              Stack(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.asset(
                        project.thumbnail,
                        width: isDesktop
                            ? 1200 / 2.5
                            : MediaQuery.of(context).size.width * 0.9 / 2.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Gradient Overlay
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(16)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  // Project Title on Image
                  Positioned(
                    bottom: 32,
                    left: 32,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          project.name,
                          style: AppTheme.lightTheme.textTheme.displaySmall
                              ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            _buildTag('Mobile App'),
                            const SizedBox(width: 8),
                            _buildTag('Flutter'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Close Button
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                ],
              ),

              // Content Section
              Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Project Stats Grid
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: isDesktop ? 4 : 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 2,
                      children: [
                        _buildStatCard(
                          'Development Time',
                          project.stats?.developmentTime ?? '3 Months',
                          Icons.access_time,
                        ),
                        _buildStatCard(
                          'Team Size',
                          project.stats?.teamSize ?? '2 Members',
                          Icons.group,
                        ),
                        _buildStatCard(
                          'Platform',
                          project.stats?.platform ?? 'iOS & Android',
                          Icons.devices,
                        ),
                        _buildStatCard(
                          'Status',
                          project.stats?.status ?? 'Completed',
                          Icons.check_circle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),

                    // Key Features Section
                    Text(
                      'Key Features',
                      style: AppTheme.lightTheme.textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: project.features
                          .map((feature) => _buildFeatureCard(feature))
                          .toList(),
                    ),
                    const SizedBox(height: 40),

                    // Technologies Used
                    Text(
                      'Technologies Used',
                      style: AppTheme.lightTheme.textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: project.skills
                          .map((skill) => _buildTechChip(skill))
                          .toList(),
                    ),
                    const SizedBox(height: 40),

                    // Project Description
                    Text(
                      'Project Overview',
                      style: AppTheme.lightTheme.textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 24),
                    ...project.details.map((section) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (section.title.isNotEmpty) ...[
                              const SizedBox(height: 32),
                              Text(
                                section.title,
                                style: AppTheme.lightTheme.textTheme.titleLarge,
                              ),
                              const SizedBox(height: 16),
                            ],
                            ...section.items.map((item) => Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 8),
                                        width: 6,
                                        height: 6,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[400],
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          item,
                                          style: AppTheme
                                              .lightTheme.textTheme.bodyLarge
                                              ?.copyWith(
                                            height: 1.6,
                                            color: Colors.grey[800],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        )),
                    const SizedBox(height: 40),

                    // Call to Action Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (await canLaunchUrl(Uri.parse(project.link))) {
                            await launchUrl(Uri.parse(project.link));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'View Project',
                              style: AppTheme.lightTheme.textTheme.titleMedium
                                  ?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward,
                                color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(Feature feature) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            feature.title,
            style: AppTheme.lightTheme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            feature.description,
            style: AppTheme.lightTheme.textTheme.bodyMedium?.copyWith(
              height: 1.6,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechChip(String tech) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Text(
        tech,
        style: TextStyle(
          color: Colors.grey[800],
          fontSize: 14,
        ),
      ),
    );
  }
}
