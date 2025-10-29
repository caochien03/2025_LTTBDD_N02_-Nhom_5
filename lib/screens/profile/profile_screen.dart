import 'package:flutter/material.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'My Profile',
        userName: 'TravelMate User',
        userAvatar: null,
      ),
      body: const Center(
        child: Text('Profile Screen', style: TextStyle(fontSize: 24)),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
