import 'package:flutter/material.dart';

import 'common/app_theme.dart';
import 'pages/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ClassReportApp());
}

class ClassReportApp extends StatelessWidget {
  const ClassReportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClassReport',
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,

      home: const SplashPage(),
    );
  }
}
