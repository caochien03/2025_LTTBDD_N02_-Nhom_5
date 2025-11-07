import 'package:flutter/material.dart';
import '../providers/navigation_provider.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../localization/app_localizations.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final l10n = AppLocalizations.of(context)!;

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
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: l10n.profile,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.explore),
          label: l10n.explore,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite),
          label: l10n.favorites,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.book),
          label: l10n.diary,
        ),
      ],
    );
  }
}
