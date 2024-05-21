import 'package:flutter/material.dart';
import 'package:photo_gallery/product_list_screen.dart';


class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery',
      theme: _lightThemeData(),
      darkTheme: _darkThemeData(),
       themeMode: ThemeMode.system,
      // themeMode: ThemeMode.dark,
      home: ProductListScreen(),
    );

  }


  ThemeData _lightThemeData() {
    return ThemeData(
      brightness: Brightness.light,
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(double.maxFinite),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
            )
        )

    );
  }

  ThemeData _darkThemeData() {
    return ThemeData(
      brightness: Brightness.dark,
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(double.maxFinite),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: Colors.purple,
              foregroundColor: Colors.white,
            )
        )

    );
  }


}