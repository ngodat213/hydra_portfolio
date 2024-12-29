import 'package:flutter/material.dart';
import '../models/blog_post.dart';
import '../theme/app_theme.dart';
import '../utils/size_utils.dart';
import 'package:go_router/go_router.dart';
import '../services/blog_service.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            _buildBlogPosts(context),
          ],
        ),
      ),
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
            'Latest Programming Content',
            style: AppTheme.lightTheme.textTheme.displayLarge,
          ),
          const SizedBox(height: 24),
          Text(
            'Stay up-to-date with the latest developments in Java and JavaScript programming, best practices, and industry insights.',
            style: AppTheme.lightTheme.textTheme.titleLarge?.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlogPosts(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: SizeUtils.safeBlockHorizontal * 15,
      ),
      child: FutureBuilder<List<BlogPost>>(
        future: BlogService.getPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          final posts = snapshot.data ?? [];
          return Column(
            children: posts.map((post) {
              return Column(
                children: [
                  _buildBlogCard(
                    context,
                    post: post,
                  ),
                  const SizedBox(height: 40),
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Widget _buildBlogCard(
    BuildContext context, {
    required BlogPost post,
  }) {
    return GestureDetector(
      onTap: () => context.go('/blog/${post.id}', extra: post),
      child: Container(
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
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(8),
                  ),
                  child: Image.asset(
                    post.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            post.readTime,
                            style: AppTheme.lightTheme.textTheme.bodySmall,
                          ),
                          const SizedBox(width: 16),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              post.type,
                              style: AppTheme.lightTheme.textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        post.title,
                        style: AppTheme.lightTheme.textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        post.description,
                        style:
                            AppTheme.lightTheme.textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
