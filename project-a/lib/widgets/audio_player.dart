import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'audio_waveform.dart';

class AudioPlayer extends ConsumerWidget {
  AudioPlayer(this.path, {Key? key}) : super(key: key);

  late final _viewModel =
      StateNotifierProvider.autoDispose<_AudioPlayerViewModel, PlayerState>(
    (ref) => _AudioPlayerViewModel()..initializePlayer(path),
  );

  final String path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_viewModel);
    final viewModel = ref.read(_viewModel.notifier);
    final isInitialized = state != PlayerState.stopped;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.play_arrow_outlined,
                ),
                onPressed: isInitialized ? viewModel.toggle : null,
              ),
              if (isInitialized)
                Expanded(
                  child: AudioPlayerWaveform(
                    controller: viewModel.controller,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AudioPlayerViewModel extends StateNotifier<PlayerState> {
  _AudioPlayerViewModel() : super(PlayerState.stopped);

  late final controller = PlayerController()
    ..onPlayerStateChanged.listen((event) => state = event);

  void initializePlayer(String path) async {
    await controller.preparePlayer(path: path, volume: 1.0);
  }

  void toggle() async {
    if (state != PlayerState.paused) {
      await controller.startPlayer();
    } else if (state == PlayerState.playing) {
      await controller.pausePlayer();
    }
  }
}
