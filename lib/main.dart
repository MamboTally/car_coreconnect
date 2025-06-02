import 'package:car_coreconnect/core/gen/fonts.gen.dart';
import 'package:car_coreconnect/core/theme/colors.dart';
import 'package:car_coreconnect/features/home_feature/presentation/screens/home_screen.dart';
import 'package:car_coreconnect/home.dart';
import 'package:flutter/material.dart';
import 'package:car_coreconnect/login.dart';
import 'package:car_coreconnect/map_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main(List<String> args)async{
  //firebase initialisation
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyDRULeytGxADUsVL1tjYMOeKLhsaDxrheM",
        appId: "1:267148072799:android:f33c9e873dacdd4f34c8ea",
        messagingSenderId: "267148072799",
        projectId: "vehicle-58fbd"),
  );
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoreConnect',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          brightness: Brightness.dark,
        ),
        fontFamily: FontFamily.poppinsRegular,
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.backgroundColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20.0,
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),

    );
  }
}
