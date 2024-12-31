import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydra_profolio/theme/app_theme.dart';

class HomeMobileContent extends StatelessWidget {
  const HomeMobileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildMobileIntro(),
          _buildMobileFeaturedWorks(),
          _buildMobileTools(),
        ],
      ),
    );
  }

  Widget _buildMobileIntro() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ngô Văn Tiến Đạt',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Fresher Mobile Developer',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            "I craft seamless and engaging mobile experiences with Flutter, turning ideas into beautifully functional applications that captivate users.",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            child: const Text(
              'See projects',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileFeaturedWorks() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Works',
            style: AppTheme.lightTheme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 24),
          _buildMobileProjectCard(
            category: 'Mobile App, Flutter',
            title: 'Kiwis',
            description:
                'A dynamic social app enabling real-time messaging and seamless trip planning. Stay connected with friends, organize adventures effortlessly, and make every journey memorable.',
            imagePath: 'assets/images/project1.png',
          ),
          const SizedBox(height: 24),
          _buildMobileProjectCard(
            category: 'Mobile App, Flutter',
            title: 'ECourse',
            description:
                'A course app that allows users to learn, practice programming languages and take exams.',
            imagePath: 'assets/images/project2.png',
          ),
          const SizedBox(height: 24),
          _buildMobileProjectCard(
            category: 'Web App, Spring Boot',
            title: 'Pulse Music',
            description:
                'A music streaming platform that allows users to stream music and create playlists.',
            imagePath: 'assets/images/project3.png',
          ),
        ],
      ),
    );
  }

  Widget _buildMobileProjectCard({
    required String category,
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                TextButton.icon(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  icon: const Text(
                    'View case study',
                    style: TextStyle(color: Colors.white),
                  ),
                  label: const Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileTools() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tools I Use',
            style: AppTheme.lightTheme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'I leverage modern development tools and frameworks to build robust, scalable applications that deliver exceptional user experiences.',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 16,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.2,
            children: [
              _buildToolCard(
                icon: 'assets/icons/cursorAI.jpg',
                name: 'Cursor',
                description: 'AI Assistant',
              ),
              _buildToolCard(
                icon: 'assets/icons/firebase.png',
                name: 'Firebase',
                description: 'Backend Services',
              ),
              _buildToolCard(
                icon: 'assets/icons/aws.png',
                name: 'AWS',
                description: 'Cloud Services',
              ),
              _buildToolCard(
                icon: 'assets/icons/github.png',
                name: 'GitHub',
                description: 'Version Control',
              ),
              _buildToolCard(
                icon: 'assets/icons/figma.png',
                name: 'Figma',
                description: 'UI Design',
              ),
              _buildToolCard(
                icon: 'assets/icons/vscode.png',
                name: 'VS Code',
                description: 'Code Editor',
              ),
              _buildToolCard(
                icon: 'assets/icons/postman.png',
                name: 'Postman',
                description: 'API Testing',
              ),
              _buildToolCard(
                icon: 'assets/icons/notion.png',
                name: 'Notion',
                description: 'Project Management',
              ),
              _buildToolCard(
                icon: 'assets/icons/chatgpt.png',
                name: 'ChatGPT',
                description: 'AI Assistant',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToolCard({
    required String icon,
    required String name,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Image.asset(
            icon,
            width: 50,
            height: 50,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
