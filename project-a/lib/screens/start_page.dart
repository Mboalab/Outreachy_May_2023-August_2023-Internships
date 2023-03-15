import 'package:flutter/material.dart';

import '../main.dart';
import '../widgets/onboarding_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/img.png',
              height: 280,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: FittedBox(
                child: Text(
                  'mboathoscope',
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Button(
              text: 'Get Started',
              onPressed: () => Navigator.pushNamed(context, AppRoutes.rolePage),
            ),
          ],
        ),
      ),
    );
  }
}
