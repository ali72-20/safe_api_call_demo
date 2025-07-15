import 'package:flutter/material.dart';
import 'package:untitled2/presentation/ui/screen/widgets/demo_screen.dart';

import 'di/di.dart';

void main() {
  configureDependencies();
  runApp(const SafeApiCallDemo());
}

class SafeApiCallDemo extends StatelessWidget {
  const SafeApiCallDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safe Api Call Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: DemoScreen(),
    );
  }
}
