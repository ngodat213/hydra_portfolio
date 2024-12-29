import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hydra_profolio/utils/responsive_layout.dart';
import '../models/blog_post.dart';
import '../theme/app_theme.dart';
import '../utils/size_utils.dart';
import '../widgets/table_of_contents.dart';

class BlogDetailScreen extends StatelessWidget {
  final BlogPost post;
  final ScrollController _scrollController = ScrollController();

  BlogDetailScreen({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ResponsiveWidget(
        mobile: _buildMobileContent(),
        desktop: _buildDesktopContent(),
      ),
    );
  }

  Widget _buildMobileContent() {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildDesktopContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                _buildContent(),
              ],
            ),
          ),
        ),
        TableOfContents(
          content: post.content,
          onHeadingTap: (heading) => _scrollToHeading(heading),
        ),
      ],
    );
  }

  void _scrollToHeading(String heading) {
    // Implement scroll logic here
    // You might need to use GlobalKey or other methods to find heading position
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(post.imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.7),
            ],
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.safeBlockHorizontal * 15,
          vertical: 40,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  post.readTime,
                  style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    post.type,
                    style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              post.title,
              style: AppTheme.lightTheme.textTheme.displayMedium?.copyWith(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              post.description,
              style: AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/avatar.jpg'),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.author,
                      style: AppTheme.lightTheme.textTheme.titleSmall?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      post.publishDate.toString().split(' ')[0],
                      style: AppTheme.lightTheme.textTheme.bodySmall?.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeUtils.safeBlockHorizontal * 15,
        vertical: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: post.tags.map((tag) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '#$tag',
                  style: AppTheme.lightTheme.textTheme.bodySmall,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 32),
          MarkdownBody(
            data: post.content,
            styleSheet: MarkdownStyleSheet(
              h1: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 32,
                fontWeight: FontWeight.bold,
                height: 1.4,
              ),
              h2: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 24,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
              h3: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
              p: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                height: 1.8,
                color: Color(0xFF2C3E50),
              ),
              listBullet: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                height: 1.8,
                color: Color(0xFF2C3E50),
              ),
              code: const TextStyle(
                fontFamily: 'RobotoMono',
                fontSize: 14,
                height: 1.5,
                backgroundColor: Color(0xFFF5F6F7),
              ),
              codeblockDecoration: BoxDecoration(
                color: const Color(0xFFF5F6F7),
                borderRadius: BorderRadius.circular(8),
              ),
              blockquote: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 16,
                height: 1.8,
                color: Color(0xFF546E7A),
                fontStyle: FontStyle.italic,
              ),
              blockquoteDecoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Colors.grey[300]!,
                    width: 4,
                  ),
                ),
              ),
              tableCellsPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              tableColumnWidth: const FlexColumnWidth(),
              tableBody: const TextStyle(
                fontFamily: 'Roboto',
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
