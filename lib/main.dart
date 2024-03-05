import 'package:flutter/material.dart';
import 'package:mobile_app/src/admin/ui/general/general.dart';
import 'package:mobile_app/src/client/ui/cart/cart_screen.dart';
import 'package:mobile_app/src/client/ui/general/general.dart';
import 'package:mobile_app/src/public/screen_intro/screen_intro.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:mobile_app/src/client/general/general.dart';
// import 'package:mobile_app/src/public/screen_intro/screen_intro.dart';
// import './src/admin/screen_intro.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => BottomNavigationModel(),
      child: const MyApp(),
    ),

    // ChangeNotifierProvider(
    //   create: (context) => BottomNavigationModelAdmin(),
    //   child: const MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.purple,
      secondary: Colors.deepOrange,
      background: Colors.white,
      surfaceTint: Colors.grey[200],
    );
    final themeData = ThemeData(
      fontFamily: 'Lato',
      colorScheme: colorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 4,
        shadowColor: colorScheme.shadow,
      ),
    );
    return MaterialApp(
      // theme: themeData,
      debugShowCheckedModeBanner: false,

      // Loading voi firebase
      // home: FutureBuilder(
      //   future: Future.delayed(const Duration(seconds: 2), () => true),
      //   builder: (context, snapshot) {
      //     // Trạng thái đợi kết nối firebase
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     // Lỗi khi kết nối firebase không thành công
      //     else if (snapshot.hasError) {
      //       return const Center(
      //         child: Text('Error initializing Firebase'),
      //       );
      //     }
      //     // Khi kết nối với firebase thành công
      //     else {
      //       return const BottomNavigation();
      //       //return AdminIntroScreen();
      //     }
      //   },
      // ),

      // home: ScreenIntro(),
      //  home: AdminIntroScreen(),
      // home: const CartScreen(),
      home: BottomNavigation(),
      // home: BottomNavigationAdmin(),
    );
  }
}
