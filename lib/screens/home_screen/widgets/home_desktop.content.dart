import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydra_profolio/theme/app_theme.dart';
import 'package:hydra_profolio/utils/size_utils.dart';
import 'package:hydra_profolio/widgets/footer.dart';

class HomeDesktopContent extends StatelessWidget {
  const HomeDesktopContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _introductDesktopContent(),
          _featureWorksContent(),
          _toolContent(),
          const Footer(),
        ],
      ),
    );
  }

  Container _featureWorksContent() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeUtils.safeBlockHorizontal * 15,
        vertical: SizeUtils.safeBlockVertical * 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Works',
            style: AppTheme.lightTheme.textTheme.displayLarge,
          ),
          const SizedBox(height: 24),
          _buildFeaturedWorkCard(
            category: 'Mobile App, Flutter',
            title: 'Kiwis',
            description:
                'A dynamic social app enabling real-time messaging and seamless trip planning. Stay connected with friends, organize adventures effortlessly, and make every journey memorable.',
            imagePath: 'assets/images/project1.png',
            showButton: true,
          ),
          const SizedBox(height: 40),
          _buildFeaturedWorkCard(
            category: 'Mobile App, Flutter',
            title: 'ECourse',
            description:
                'A course app that allows users to learn, practice programming languages and take exams.',
            imagePath: 'assets/images/project2.png',
            showButton: true,
          ),
          const SizedBox(height: 40),
          _buildFeaturedWorkCard(
            category: 'Web App, Spring Boot',
            title: 'Pulse Music',
            description:
                'A music streaming platform that allows users to stream music and create playlists.',
            imagePath: 'assets/images/project3.png',
            showButton: true,
          ),
        ],
      ),
    );
  }

  Container _toolContent() {
    return Container(
      width: SizeUtils.safeBlockHorizontal * 100,
      padding: EdgeInsets.symmetric(
        horizontal: SizeUtils.safeBlockHorizontal * 15,
        vertical: SizeUtils.safeBlockVertical * 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tools I Use',
            style: AppTheme.lightTheme.textTheme.displayMedium,
          ),
          const SizedBox(height: 24),
          Text(
            'I leverage modern development tools and frameworks to build robust, scalable applications that deliver exceptional user experiences.',
            style: GoogleFonts.spaceGrotesk(
              fontSize: 20,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 40),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 2.5,
            children: [
              _buildToolCard(
                icon: 'assets/icons/cursorAI.jpg',
                name: 'Cursor',
                description: 'AI Code Editor',
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

  Widget _buildFeaturedWorkCard({
    required String category,
    required String title,
    required String description,
    String? imagePath,
    bool? showButton,
  }) {
    return Container(
      width: double.infinity,
      height: 400,
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          children: [
            // Background Image
            Positioned(
              right: 0,
              bottom: 10,
              child: imagePath != null
                  ? Image.asset(
                      width: SizeUtils.screenWidth * 0.4,
                      imagePath,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(),
            ),
            // Content Overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.grey.withOpacity(0.1),
                      Colors.black.withOpacity(0.1),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      category,
                      style: GoogleFonts.spaceGrotesk(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: SizeUtils.safeBlockHorizontal * 30,
                      child: Text(
                        description,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    if (showButton == true)
                      TextButton.icon(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                        ),
                        icon: const Text('View case study',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        label: const Icon(Icons.arrow_forward,
                            color: Colors.white),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _introductDesktopContent() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.safeBlockHorizontal * 15,
          vertical: SizeUtils.safeBlockVertical * 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ngô Văn Tiến Đạt',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Fresher Mobile Developer',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Text(
            "I craft seamless and engaging mobile experiences with Flutter, turning ideas into beautifully functional applications that captivate users.",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: SizeUtils.safeBlockHorizontal * 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                  ),
                  child: const Text(
                    'See projects',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: SizeUtils.safeBlockHorizontal * 40,
                  child: const Text(
                      'With a focus on building intuitive, high-performance apps, I create solutions that not only meet technical requirements but also deliver unforgettable user experiences.'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _workExpDesktopContent() {
    return Container(
      width: SizeUtils.safeBlockHorizontal * 100,
      height: SizeUtils.safeBlockVertical * 100,
      color: const Color(0xffF5F5F0),
      padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.safeBlockHorizontal * 15,
          vertical: SizeUtils.safeBlockVertical * 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'About me',
            style: AppTheme.lightTheme.textTheme.displayMedium,
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: SizeUtils.safeBlockHorizontal * 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Me',
                      style: AppTheme.lightTheme.textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      'Hello! My name is Ngo Dat and I enjoy creating things that live on the internet. My interest in mobile development started back in 2021 when I decided to clone some applications - turns my passion into profession.Currently, I am a 4-year student at Ho Chi Minh City University of Technology (HUTECH).',
                      style: AppTheme.lightTheme.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: SizeUtils.safeBlockHorizontal * 30,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Working Experience',
                      style: AppTheme.lightTheme.textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 40),
                    _buildExperienceItem(
                      logo: 'U',
                      company: 'Internship at Digital for life',
                      period: 'July 2024 - Present',
                      backgroundColor: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem({
    required String logo,
    required String company,
    required String period,
    required Color backgroundColor,
  }) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              logo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                company,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                period,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAwardItem({
    required String logo,
    required String award,
    required String date,
  }) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              logo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                award,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_outward),
          color: Colors.black,
        ),
      ],
    );
  }
}