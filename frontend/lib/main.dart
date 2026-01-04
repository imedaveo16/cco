import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dgpc_cco/firebase_options.dart';
import 'package:dgpc_cco/screens/dashboard_screen.dart';
import 'package:dgpc_cco/theme/sovereign_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const CCOApp());
}

class CCOApp extends StatelessWidget {
  const CCOApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DGPC Mission Control',
      debugShowCheckedModeBanner: false,
      theme: SovereignTheme.themeData,
      home: const DashboardScreen(),
    );
  }
}
