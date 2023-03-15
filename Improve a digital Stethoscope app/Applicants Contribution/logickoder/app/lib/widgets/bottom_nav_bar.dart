import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BottomNavigationBar(
      backgroundColor: theme.colorScheme.background,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/images/img_profile.png"),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/images/img_explore.png"),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/images/img_recordings.png"),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage("assets/images/img_setting.png"),
          ),
          label: '',
        )
      ],
      selectedItemColor: theme.colorScheme.primary,
      unselectedItemColor: Colors.black,
    );
  }
}
