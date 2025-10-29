import 'package:flutter/material.dart';
import '../providers/navigation_provider.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: navigationProvider.selectedIndex,
      onTap: (index) {
        navigationProvider.changeTab(index);

        // Navigate to different routes using GoRouter
        switch (index) {
          case 0:
            context.go('/profile');
            break;
          case 1:
            context.go('/explore');
            break;
          case 2:
            context.go('/favorites');
            break;
          case 3:
            context.go('/diary');
            break;
        }
      },
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Diary'),
      ],
    );
  }
}
