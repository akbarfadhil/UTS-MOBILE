import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';
import 'home_page.dart';
import 'list_page.dart';
import 'settings_page.dart';
import 'edit_profile_page.dart';
import 'settings_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: SettingsService.textScaleFactor,
      builder: (context, scale, child) {
        return MaterialApp(
          title: 'Hadist Digital',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Roboto',
          ),
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: scale),
              child: child!,
            );
          },
          initialRoute: '/login',
          routes: {
            '/login': (context) => const LoginScreen(),
            '/register': (context) => const RegisterScreen(),
            '/home': (context) => const HomePage(),
            '/list': (context) => const ListPage(),
            '/settings': (context) => const SettingsPage(),
            '/edit_profile': (context) => const EditProfilePage(),
          },
        );
      },
    );
  }
}