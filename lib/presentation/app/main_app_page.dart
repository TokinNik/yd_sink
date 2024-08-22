import 'package:flutter/material.dart';
import 'package:template_app/ui/core/colors.dart';

import '../splash_screen/splash_screen.dart';

class MainAppPage extends StatelessWidget {
  const MainAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      body: SplashScreen(),
    );
  }
}
