import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/explore/explore_screen.dart';
import '../screens/favorites/favorites_screen.dart';
import '../screens/diary/diary_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/profile',
    routes: [
      GoRoute(
        path: '/profile',
        name: 'profile',
        pageBuilder:
            (context, state) => _buildPageWithTransition(
              child: const ProfilePage(),
              state: state,
            ),
      ),
      GoRoute(
        path: '/explore',
        name: 'explore',
        pageBuilder:
            (context, state) => _buildPageWithTransition(
              child: const ExplorePage(),
              state: state,
            ),
      ),
      GoRoute(
        path: '/favorites',
        name: 'favorites',
        pageBuilder:
            (context, state) => _buildPageWithTransition(
              child: const FavoritesScreen(),
              state: state,
            ),
      ),
      GoRoute(
        path: '/diary',
        name: 'diary',
        pageBuilder:
            (context, state) => _buildPageWithTransition(
              child: const DiaryScreen(),
              state: state,
            ),
      ),
    ],
  );
}

// Custom page với smooth transition
CustomTransitionPage<void> _buildPageWithTransition({
  required Widget child,
  required GoRouterState state,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 0.02),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
          ),
          child: child,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 250),
  );
}
