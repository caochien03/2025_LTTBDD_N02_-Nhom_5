import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? userName;
  final String? userAvatar;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.userName,
    this.userAvatar,
    this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // Header with user info and title
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // User info section
                  Row(
                    children: [
                      // Avatar
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white.withOpacity(0.3),
                        backgroundImage:
                            userAvatar != null
                                ? NetworkImage(userAvatar!)
                                : null,
                        child:
                            userAvatar == null
                                ? const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 30,
                                )
                                : null,
                      ),
                      const SizedBox(width: 12),
                      // User name
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            userName ?? 'Traveler',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Have a great day!',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Actions
                  if (actions != null) Row(children: actions!),
                ],
              ),
            ),
            // Title section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
