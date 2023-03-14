import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../buttons/headerHalf.dart';
import '../widgets/audio_recorder.dart';
import '../widgets/bottom_nav_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Column(
        children: const [
          headerHalf(),
          // RecordingList(),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          AudioRecorder(),
          BottomNavBar(),
        ],
      ),
    );
  }
}
