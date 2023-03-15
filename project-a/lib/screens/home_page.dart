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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'assets/images/img_head.png',
              height: 100,
              width: 100,
            ),
          ),
        ),
        actions: [
          IconButton(
            iconSize: 40,
            onPressed: () {},
            icon: const Icon(Icons.notifications),
            color: theme.colorScheme.primary,
          ),
        ],
      ),
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemCount: recordings.length + 1,
          itemBuilder: (_, index) {
            if (index == 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Press the microphone button to transmit the sound',
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Please ensure that you are wearing noise cancelling headphones',
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Recordings',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  )
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
