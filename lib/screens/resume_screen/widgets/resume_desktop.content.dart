import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydra_profolio/theme/app_theme.dart';
import 'package:hydra_profolio/utils/size_utils.dart';

class ResumeDesktopContent extends StatelessWidget {
  const ResumeDesktopContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: SizeUtils.safeBlockHorizontal * 15,
        vertical: SizeUtils.safeBlockVertical * 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              Text(
                'Ngô Văn Tiến Đạt',
                style: AppTheme.lightTheme.textTheme.displayMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Fresher Flutter Developer',
                style: AppTheme.lightTheme.textTheme.titleLarge,
              ),
              const SizedBox(height: 16),

              // Contact info and social links
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_on_outlined, size: 16),
                  const SizedBox(width: 8),
                  const Text('District 9'),
                  const SizedBox(width: 24),
                  const Icon(Icons.mail_outline, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    'ngodat213@gmail.com',
                    style: GoogleFonts.spaceGrotesk(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialLink('hydra.coder', true),
                  _buildSocialLink('hydracoder', false),
                  _buildSocialLink('ngodat213', false),
                ],
              ),

              const SizedBox(height: 40),

              // Education Section
              _buildSection(
                'Sumary',
                [
                  _buildSummaryItem(
                    'Hi, I\'m Ngo Van Tien Dat, a third-year Information Technology student at Ho Chi Minh City University of Technology (HUTECH). My goal is to become a skilled Flutter developer, and I\'m always eager to learn and take on challenges. I thrive in both collaborative teamwork and independent work environments. Please feel free to take a look at my resume whenever you have the chance.',
                  ),
                ],
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              const SizedBox(height: 40),
              _buildSection(
                'Education',
                [
                  _buildTimelineItem(
                    'Hutech University',
                    'Software Engineering',
                    'Oct 2021 - present',
                    details: [
                      'Information technology at HUTECH University.',
                      'I have some basic certifications in programming and experience participating in programming competitions like the Olympics and participating in algorithm sites Codelearn.io. Besides, I have the ability to self-study, teamwork, and the ability to withstand work pressure.',
                    ],
                  ),
                ],
              ),
            ],
          ),
          // Header with name and title
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          const SizedBox(height: 40),

          // Experience Section
          _buildSection(
            'Experience',
            [
              _buildTimelineItem(
                'Di4l',
                'Internship Flutter Developer',
                'July 2024 - present',
                skills: [
                  'Flutter',
                  'Dart',
                  'Firebase',
                  'VietMap',
                  'GetX',
                  'MVVM',
                  'FCM',
                  'Firebase',
                  'Google Map',
                  'Provider',
                ],
                details: [
                  'Improving the UI & UX of Femicam\'s desktop application based on React Electron and Material UI',
                  'Designing and creating React components for the application dashboard',
                ],
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          const SizedBox(height: 40),

          // Featured Project Section
          _buildSection(
            'My Projects',
            [
              _buildTimelineItem(
                'Kiwis',
                '',
                '',
                skills: [
                  'Flutter',
                  'Dart',
                  'Firebase',
                  'VietMap',
                  'AWS',
                  'GetX',
                  'NodeJs',
                  'MySQL',
                  'Socket',
                  'FCM',
                  'Cloudinary'
                ],
                details: [
                  'Kiwis is a mobile application that allows users to find and book services in their area. It is built with Flutter and Dart, and uses Firebase for authentication, database, and cloud storage. The application also uses VietMap for map services and AWS for cloud storage.',
                ],
                link: 'https://github.com/ngodat213/kiwis',
              ),
              _buildTimelineItem(
                'Pulse Music Streaming',
                '',
                '',
                skills: [
                  'Spring Boot',
                  'MySQL',
                  'Java',
                  'Thymeleaf',
                  'Bootstrap',
                ],
                details: [
                  'Web application for listening to music using Spring Boot security, thymeleaf',
                  'Designed MySQL database schema, Developed backend with Java Spring Boot, integrated frontend and backend',
                  'User authentication and authorization, Admin dashboard, CRUD operations, mailer, Server-side rendering with Thymeleaf, Cloudinary for media storage, OAuth2 for authentication.',
                ],
                link: ' https://github.com/ngodat213/pulse_music_sb',
              ),
              _buildTimelineItem(
                'ECourse',
                '',
                '',
                skills: [
                  'Flutter',
                  'Dart',
                  'VietMap',
                  'GetX',
                  'NestJs',
                  'MongoDB',
                  'Cloudinary'
                ],
                details: [
                  'Kiwis is a mobile application that allows users to find and book services in their area. It is built with Flutter and Dart, and uses Firebase for authentication, database, and cloud storage. The application also uses VietMap for map services and AWS for cloud storage.',
                ],
                link: 'https://github.com/ngodat213/ecourse_flutter',
              ),
              _buildTimelineItem(
                'ECourse Backend',
                '',
                '',
                skills: [
                  'NestJs',
                  'MongoDB',
                  'TypeScript',
                  'Bootstrap',
                ],
                details: [
                  'Web application for listening to music using Spring Boot security, thymeleaf',
                  'Designed MySQL database schema, Developed backend with Java Spring Boot, integrated frontend and backend',
                  'User authentication and authorization, Admin dashboard, CRUD operations, mailer, Server-side rendering with Thymeleaf, Cloudinary for media storage, OAuth2 for authentication.',
                ],
                link: ' https://github.com/ngodat213/ecourse_nestjs',
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          const SizedBox(height: 40),

          // Skills Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: SizeUtils.safeBlockHorizontal * 10,
                child: Text(
                  'Skills & Tools',
                  style: AppTheme.lightTheme.textTheme.titleLarge,
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: SizeUtils.safeBlockHorizontal * 60 - 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _buildSkillsSection('Languages', [
                      'Java',
                      'Dart',
                      'TypeScript',
                      'JavaScript',
                      'SQL',
                      'C#',
                      'C/C++',
                    ]),
                    _buildSkillsSection('Technologies', [
                      'Flutter',
                      'Firebase',
                      'AWS',
                      'NodeJs',
                      'MySQL',
                      'Socket',
                      'FCM',
                      'Cloudinary',
                      'NestJs',
                      'ASP.NET',
                    ]),
                    _buildSkillsSection('Tools & Softwares', [
                      'VS Code',
                      'Cursor',
                      'Git',
                      'Intellij',
                      'Figma',
                      'Postman',
                      'Photoshop',
                    ]),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialLink(String text, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> items) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: SizeUtils.safeBlockHorizontal * 10,
          child: Text(
            title,
            style: AppTheme.lightTheme.textTheme.titleLarge,
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: SizeUtils.safeBlockHorizontal * 60 - 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items,
          ),
        )
      ],
    );
  }

  Widget _buildSummaryItem(String title) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      width: SizeUtils.safeBlockHorizontal * 55,
      child: Text(title, style: AppTheme.lightTheme.textTheme.bodyLarge),
    );
  }

  Widget _buildTimelineItem(
    String title,
    String subtitle,
    String period, {
    List<String>? skills,
    List<String>? details,
    String? link,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: AppTheme.lightTheme.textTheme.titleMedium,
                  ),
                ],
              ),
            ),
            if (period.isNotEmpty)
              Text(
                period,
                style: AppTheme.lightTheme.textTheme.bodySmall,
              ),
          ],
        ),
        if (subtitle.isNotEmpty)
          Text(
            subtitle,
            style: AppTheme.lightTheme.textTheme.bodyMedium,
          ),
        if (skills != null) ...[
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skills
                .map((skill) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        skill,
                        style: AppTheme.lightTheme.textTheme.bodySmall,
                      ),
                    ))
                .toList(),
          ),
        ],
        if (details != null) ...[
          const SizedBox(height: 12),
          ...details.map((entry) => Container(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(width: 5, height: 5, color: Colors.grey),
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(entry)),
                  ],
                ),
              )),
        ],
        if (link != null) ...[
          Container(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(width: 5, height: 5, color: Colors.grey),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  child: Text(
                    link,
                    style: AppTheme.lightTheme.textTheme.bodyMedium
                        ?.copyWith(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildSkillsSection(String title, List<String> skills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTheme.lightTheme.textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: skills
              .map((skill) => Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      skill,
                      style: AppTheme.lightTheme.textTheme.bodySmall,
                    ),
                  ))
              .toList(),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
