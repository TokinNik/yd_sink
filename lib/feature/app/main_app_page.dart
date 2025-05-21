import 'package:flutter/material.dart';
import 'package:YDsync/core/utils/extensions/context_extensions.dart';

import '../splash/splash_screen.dart';

class MainAppPage extends StatelessWidget {
  const MainAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(extendBody: true, backgroundColor: context.colors.contentPrimary, body: const SplashScreen());
  }
}
