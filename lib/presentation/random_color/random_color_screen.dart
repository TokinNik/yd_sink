import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:template_app/presentation/app/app_router.dart';

@RoutePage()
class RandomColorScreen extends StatelessWidget {
  const RandomColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                context.router.push(const TempListRoute());
              },
              child: const Text("In deep"),
            ),
          ],
        ),
      ),
    );
  }
}
