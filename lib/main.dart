import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'router/app_router.dart';
import 'providers/navigation_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: MaterialApp.router(
        title: 'BTL TravelMate',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.light(
            primary: const Color(0xFF2563EB), // Ocean Blue
            secondary: const Color(0xFFEA580C), // Sunset Orange
            background: const Color(0xFFF8FAFC),
            surface: Colors.white,
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            onBackground: const Color(0xFF1E293B),
            onSurface: const Color(0xFF1E293B),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF2563EB),
            foregroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            selectedItemColor: Color(0xFF2563EB),
            unselectedItemColor: Color(0xFF94A3B8),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            elevation: 8,
          ),
        ),
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
