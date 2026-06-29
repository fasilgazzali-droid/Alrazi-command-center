import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class AlRaziApp extends StatelessWidget {
  const AlRaziApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al-Razi Command Center',
      debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.dark,

      theme: ThemeData(
        useMaterial3: true,
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,

        scaffoldBackgroundColor: const Color(0xff090A0F),

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff00F0FF),
          brightness: Brightness.dark,
        ),

        cardTheme: CardThemeData(
          color: const Color(0xff121420),
          elevation: 2,
          margin: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        appBarTheme: const AppBarTheme(
          centerTitle: false,
          elevation: 0,
          backgroundColor: Color(0xff121420),
          foregroundColor: Colors.white,
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xff1A1D29),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey.shade700,
            ),
          ),

          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xff00F0FF),
              width: 2,
            ),
          ),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(52),
            backgroundColor: const Color(0xff00F0FF),
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Color(0xff00F0FF),
        ),

        dividerTheme: const DividerThemeData(
          color: Colors.white24,
        ),
      ),

      home: const LoginScreen(),
    );
  }
}
