import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localization/app_localizations.dart';
import 'providers/navigation_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/locale_provider.dart';
import 'providers/theme_provider.dart';
import 'themes/app_themes.dart';
import 'router/app_router.dart';
import 'screens/auth/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Builder(
        builder: (context) {
          final themeProvider = context.watch<ThemeProvider>();
          final localeProvider = context.watch<LocaleProvider>();
          return MaterialApp(
            title: 'BTL TravelMate',
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: themeProvider.themeMode,
            debugShowCheckedModeBanner: false,
            locale: localeProvider.currentLocale,
            supportedLocales: const [Locale('en'), Locale('vi')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: const AuthGate(),
          );
        },
      ),
    );
  }
}

// Auth Gate Widget
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Not logged in -> show auth screen
        if (snapshot.data == null) {
          return const AuthScreen();
        }

        // Logged in -> show home screen with router
        return Builder(
          builder: (context) {
            final themeProvider = context.watch<ThemeProvider>();
            final localeProvider = context.watch<LocaleProvider>();
            return MaterialApp.router(
              title: 'BTL TravelMate',
              theme: AppThemes.lightTheme,
              darkTheme: AppThemes.darkTheme,
              themeMode: themeProvider.themeMode,
              locale: localeProvider.currentLocale,
              supportedLocales: const [Locale('en'), Locale('vi')],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              routerConfig: AppRouter.router,
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
