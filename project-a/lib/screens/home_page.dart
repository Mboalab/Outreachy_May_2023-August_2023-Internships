import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/recording.dart';
import '../widgets/audio_player.dart';
import '../widgets/audio_recorder.dart';
import '../widgets/bottom_nav_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final recordings = ref.watch(recordingsProvider);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemCount: recordings.length + 1,
          itemBuilder: (_, index) {
            if (index == 0) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Press and hold the button to transmit the sound',
                    style: theme.textTheme.headlineSmall,
                  ),
                  Text(
                    'Please ensure that you are wearing noise cancelling headphones',
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              );
            } else {
              return AudioPlayer(recordings[index - 1]);
            }
          },
        ),
      ),
      floatingActionButton: const AudioRecorder(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
