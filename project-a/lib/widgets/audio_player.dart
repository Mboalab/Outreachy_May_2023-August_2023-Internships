import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../data/recording.dart';
import 'audio_waveform.dart';

class AudioPlayer extends ConsumerStatefulWidget {
  const AudioPlayer(this.recording, {Key? key}) : super(key: key);

  final Recording recording;

  @override
  ConsumerState createState() => _AudioPlayerState();
}

class _AudioPlayerState extends ConsumerState<AudioPlayer> {
  late final _viewModel =
      StateNotifierProvider.autoDispose<_AudioPlayerViewModel, PlayerState?>(
    (ref) => _AudioPlayerViewModel()..initializeRecording(widget.recording),
  );

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(_viewModel);

    if (state == null) return const SizedBox();

    final viewModel = ref.read(_viewModel.notifier);
    final theme = Theme.of(context);

    return DefaultTextStyle.merge(
      style: theme.textTheme.labelSmall,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          state == PlayerState.playing
                              ? Icons.pause_circle
                              : Icons.play_arrow,
                        ),
                        onPressed: () => viewModel.toggle(ref),
                        color: theme.colorScheme.primary,
                      ),
                      Expanded(
                        child: AudioPlayerWaveform(
                          controller: viewModel.controller,
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (state == PlayerState.playing ||
                          state == PlayerState.paused) ...{
                        Consumer(builder: (_, ref, __) {
                          final duration = ref.watch(viewModel.currentDuration);
                          return duration.when(
                            loading: () => Text(
                              viewModel.maxDuration.toHHMMSS(),
                            ),
                            error: (error, stackTrace) => Text(
                              error.toString(),
                            ),
                            data: (value) => Text(value.toHHMMSS()),
                          );
                        })
                      } else ...{
                        Text(viewModel.maxDuration.toHHMMSS())
                      },
                      const SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  ref
                      .read(recordingsProvider.notifier)
                      .remove(widget.recording.path);
                },
                icon: const Icon(Icons.delete_sweep_outlined),
              ),
              IconButton(
                onPressed: () async {
                  await Share.shareXFiles(
                    [XFile(widget.recording.path)],
                    subject: widget.recording.name,
                    text: "${widget.recording.name}.${Recording.extension}",
                  );
                },
                icon: const Icon(Icons.share_outlined),
              ),
            ],
          ),
          Text(widget.recording.name),
        ],
      ),
    );
  }
}

class _AudioPlayerViewModel extends StateNotifier<PlayerState?> {
  _AudioPlayerViewModel() : super(null);

  late final controller = PlayerController()
    ..onPlayerStateChanged.listen((event) => state = event);

  late final currentDuration = StreamProvider.autoDispose(
    (ref) => controller.onCurrentDurationChanged.map(
      (duration) => Duration(milliseconds: duration),
    ),
  );

  late final maxDuration = Duration(milliseconds: controller.maxDuration);

  void initializeRecording(Recording recording) async {
    await controller.preparePlayer(path: recording.path, volume: 1.0);
  }

  void toggle(WidgetRef ref) async {
    if (state == null) return;

    if (state == PlayerState.playing) {
      await controller.pausePlayer();
    } else {
      await controller.startPlayer(finishMode: FinishMode.pause);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
