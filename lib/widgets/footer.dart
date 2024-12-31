import 'package:flutter/material.dart';
import '../utils/responsive_layout.dart';
import '../utils/size_utils.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      mobile: _buildMobileFooter(),
      desktop: _buildDesktopFooter(),
    );
  }

  Widget _buildDesktopFooter() {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        horizontal: SizeUtils.safeBlockHorizontal * 15,
        vertical: 48,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo và Mission
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hydra Coder',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Our mission is to equip modern explorers with cutting-edge, functional, and stylish bags that elevate every adventure.',
                      style: TextStyle(
                        color: Colors.grey[400],
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 64),
              // About Links
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFooterTitle('About'),
                    _buildFooterLink('About Us'),
                    _buildFooterLink('Blog'),
                    _buildFooterLink('Career'),
                  ],
                ),
              ),
              // Support Links
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFooterTitle('Support'),
                    _buildFooterLink('Contact Us'),
                    _buildFooterLink('Return'),
                    _buildFooterLink('FAQ'),
                  ],
                ),
              ),
              // Get Updates Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFooterTitle('Get Updates'),
                    const SizedBox(height: 16),
                    _buildEmailSubscribe(),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        _buildSocialIcon('assets/icons/github.png'),
                        _buildSocialIcon('assets/icons/linkedin.png'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 48),
          // Bottom Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '©2024 Hydra Coder. All rights reserved.',
                style: TextStyle(color: Colors.grey[400], fontSize: 12),
              ),
              Row(
                children: [
                  _buildFooterSmallLink('Privacy Policy'),
                  const SizedBox(width: 24),
                  _buildFooterSmallLink('Terms of Service'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobileFooter() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Logo và Mission
          const Text(
            'Hydra Coder',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Our mission is to equip modern explorers with cutting-edge, functional, and stylish bags that elevate every adventure.',
            style: TextStyle(
              color: Colors.grey[400],
              height: 1.6,
            ),
          ),
          const SizedBox(height: 32),

          // Links
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFooterTitle('About'),
                    _buildFooterLink('About Us'),
                    _buildFooterLink('Blog'),
                    _buildFooterLink('Career'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFooterTitle('Support'),
                    _buildFooterLink('Contact Us'),
                    _buildFooterLink('Return'),
                    _buildFooterLink('FAQ'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),

          // Get Updates Section
          _buildFooterTitle('Get Updates'),
          const SizedBox(height: 16),
          _buildEmailSubscribe(),
          const SizedBox(height: 24),
          Row(
            children: [
              _buildSocialIcon('assets/icons/github.png'),
              _buildSocialIcon('assets/icons/linkedin.png'),
            ],
          ),
          const SizedBox(height: 32),

          // Bottom Section
          Text(
            '©2024 Hydra Coder. All rights reserved.',
            style: TextStyle(color: Colors.grey[400], fontSize: 12),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildFooterSmallLink('Privacy Policy'),
              const SizedBox(width: 24),
              _buildFooterSmallLink('Terms of Service'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooterTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildFooterSmallLink(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey[400],
        fontSize: 12,
      ),
    );
  }

  Widget _buildEmailSubscribe() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter your email',
                hintStyle: TextStyle(color: Colors.grey[600]),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Text(
              'Subscribe',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(String iconPath) {
    return Container(
      width: 32,
      height: 32,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Image.asset(
        iconPath,
        width: 16,
        height: 16,
        color: Colors.white,
      ),
    );
  }
}
