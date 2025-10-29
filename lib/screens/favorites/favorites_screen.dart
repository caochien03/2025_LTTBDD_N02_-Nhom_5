import 'package:flutter/material.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../../widgets/custom_app_bar.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Favorites',
        userName: 'TravelMate User',
        userAvatar: null,
      ),
      body: const Center(
        child: Text('Favorites Screen', style: TextStyle(fontSize: 24)),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
