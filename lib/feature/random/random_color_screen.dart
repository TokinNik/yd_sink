import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:YDsync/feature/app/app_router.dart';

@RoutePage()
class RandomColorScreen extends StatelessWidget {
  const RandomColorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                context.router.push(const NasaMediaRoute());
              },
              child: const Text("In deep"),
            ),
          ],
        ),
      ),
    );
  }
}
