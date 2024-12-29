import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/size_utils.dart';
import '../utils/responsive_layout.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ResponsiveWidget(
          mobile: _buildMobileContent(),
          desktop: _buildDesktopContent(),
        ),
      ),
    );
  }

  Widget _buildDesktopContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        _buildFeaturedWork(),
      ],
    );
  }

  Widget _buildMobileContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMobileHeader(),
        _buildMobileFeaturedWork(),
      ],
    );
  }

  Widget _buildMobileHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ABOUT ME',
            style: AppTheme.lightTheme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Text(
            'I\'m Ngô Văn Tiến Đạt, a Flutter Developer with a passion for creating high-performance, user-friendly mobile apps. My journey started with a fascination for app development, and Flutter quickly became my go-to framework for its flexibility and efficiency. I focus on building scalable and intuitive apps while staying up-to-date with the latest mobile development trends\n\nOutside of coding, I enjoy mountain climbing, tracking, and photography. These hobbies fuel my creativity, enhance my problem-solving skills, and help me approach challenges with a fresh perspective. Looking ahead, I\'m excited to expand my expertise in Flutter and work on larger, more innovative projects.',
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Roboto',
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileFeaturedWork() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explore My Adventures',
            style: AppTheme.lightTheme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          _buildMobileProjectCard(
            location: 'Ho Chi Minh City, Vietnam',
            service: 'Sai Gon River',
            year: '2024',
            imagePath: 'assets/images/hochiminh.jpg',
          ),
          const SizedBox(height: 40),
          _buildMobileProjectCard(
            location: 'Gia Lai City, Vietnam',
            service: 'Chư Nâm Moutain Tracking',
            year: '2024',
            imagePath: 'assets/images/chunam.png',
          ),
        ],
      ),
    );
  }

  Widget _buildMobileProjectCard({
    required String location,
    required String service,
    required String year,
    required String imagePath,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  location,
                  style: AppTheme.lightTheme.textTheme.titleSmall,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Service',
                  style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  service,
                  style: AppTheme.lightTheme.textTheme.titleSmall,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Year',
                  style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  year,
                  style: AppTheme.lightTheme.textTheme.titleSmall,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: SizeUtils.safeBlockHorizontal * 15,
        vertical: SizeUtils.safeBlockVertical * 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ABOUT ME',
            style: AppTheme.lightTheme.textTheme.displayLarge,
          ),
          const SizedBox(height: 24),
          Text(
            'I\'m Ngô Văn Tiến Đạt, a Flutter Developer with a passion for creating high-performance, user-friendly mobile apps. My journey started with a fascination for app development, and Flutter quickly became my go-to framework for its flexibility and efficiency. I focus on building scalable and intuitive apps while staying up-to-date with the latest mobile development trends\n\nOutside of coding, I enjoy mountain climbing, tracking, and photography. These hobbies fuel my creativity, enhance my problem-solving skills, and help me approach challenges with a fresh perspective. Looking ahead, I\'m excited to expand my expertise in Flutter and work on larger, more innovative projects.',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Roboto',
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedWork() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeUtils.safeBlockHorizontal * 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explore My Adventures',
            style: AppTheme.lightTheme.textTheme.displayMedium,
          ),
          const SizedBox(height: 24),
          _buildProjectCard(
            location: 'Ho Chi Minh City, Vietnam',
            service: 'Sai Gon River',
            year: '2024',
            imagePath: 'assets/images/hochiminh.jpg',
          ),
          const SizedBox(height: 100),
          _buildProjectCard(
            location: 'Gia Lai City, Vietnam',
            service: 'Chư Nâm Moutain Tracking',
            year: '2024',
            imagePath: 'assets/images/chunam.png',
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard({
    required String location,
    required String service,
    required String year,
    required String imagePath,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Project Info
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location',
                  style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  location,
                  style: AppTheme.lightTheme.textTheme.titleMedium,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Service',
                  style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  service,
                  style: AppTheme.lightTheme.textTheme.titleMedium,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Year',
                  style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  year,
                  style: AppTheme.lightTheme.textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 40),
        // Project Image
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
