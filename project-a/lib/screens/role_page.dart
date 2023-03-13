import 'package:flutter/material.dart';

import '../main.dart';
import '../widgets/onboarding_button.dart';

class RolePage extends StatelessWidget {
  const RolePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/img_role.png',
                height: 280,
              ),
              const SizedBox(height: 16),
              Text(
                'Please select what your role is',
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OnboardingButton(
                    text: 'Transmitter',
                    onPressed: () {},
                  ),
                  OnboardingButton(
                    text: 'Receiver',
                    onPressed: () {},
                  )
                ],
              ),
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () => Navigator.pushNamed(
                    context,
                    AppRoutes.homePage,
                  ),
                  icon: const Text("Next"),
                  label: const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
