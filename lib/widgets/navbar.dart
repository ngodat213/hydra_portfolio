import 'package:flutter/material.dart';
import 'package:hydra_profolio/utils/size_utils.dart';
import '../utils/responsive_layout.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatelessWidget {
  final String currentRoute;

  const NavBar({
    super.key,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveLayout.isDesktop(context)
            ? SizeUtils.safeBlockHorizontal * 15
            : 20.0,
        vertical: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          const Text(
            'Hydra Coder',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Menu items
          if (ResponsiveLayout.isDesktop(context))
            Row(
              children: [
                _buildNavItem(
                  context,
                  'Home',
                  '/home',
                  isActive: currentRoute == '/home',
                ),
                _buildNavItem(
                  context,
                  'Resume',
                  '/resume',
                  isActive: currentRoute == '/resume',
                ),
                _buildNavItem(
                  context,
                  'About me',
                  '/about',
                  isActive: currentRoute == '/about',
                ),
                _buildNavItem(
                  context,
                  'Blog',
                  '/blog',
                  isActive: currentRoute == '/blog',
                ),
                _buildNavItem(
                  context,
                  'Contact',
                  '/contact',
                  isActive: currentRoute == '/contact',
                ),
              ],
            ),

          // Right section
          Row(
            children: [
              if (ResponsiveLayout.isDesktop(context)) ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Ho Chi Minh City, Vietnam',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      TimeOfDay.now().format(context),
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(width: 10),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Download CV'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context,
    String text,
    String route, {
    bool isActive = false,
  }) {
    return InkWell(
      onTap: () => context.go(route),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.black : Colors.grey,
            fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildSlotButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}
