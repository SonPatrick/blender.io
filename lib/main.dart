import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:blender/pages/home.dart';
import 'package:blender/settings/ui_themes.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        statusBarColor: Colors.black,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: true,
        systemStatusBarContrastEnforced: true),
  );
  runApp(
    MaterialApp(
      home: const Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.orange,
          elevation: 0.5,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.white,
          systemOverlayStyle: statusBarTheme,
          titleTextStyle: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            overflow: TextOverflow.fade,
          ),
          iconTheme: IconThemeData(
            color: Colors.black87,
            size: 24.0,
          ),
        ),
        snackBarTheme: const SnackBarThemeData(
          actionTextColor: Colors.black,
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
          elevation: 1.5,
          contentTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        timePickerTheme: const TimePickerThemeData(
          dayPeriodColor: Colors.orange,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.indigo,
          unselectedItemColor: Colors.black38,
          backgroundColor: Colors.white,
          elevation: 0.0,
          showSelectedLabels: true,
          showUnselectedLabels: false,
        ),
      ),
    ),
  );
}
