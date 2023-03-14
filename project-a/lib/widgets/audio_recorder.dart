import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../data/recording.dart';
import 'audio_waveform.dart';
import 'onboarding_button.dart';

final _viewModel =
    StateNotifierProvider.autoDispose<_AudioRecorderViewModel, RecorderState?>(
  (ref) => _AudioRecorderViewModel(ref.read(recordingsProvider.notifier))
    ..initialize(),
);

class AudioRecorder extends ConsumerWidget {
  const AudioRecorder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_viewModel);
    final viewModel = ref.read(_viewModel.notifier);
    final theme = Theme.of(context);

    if (state == null) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: state == RecorderState.stopped ||
              state == RecorderState.initialized
          ? Ink(
              decoration: ShapeDecoration(
                  color: theme.colorScheme.primary,
                  shape: const CircleBorder()),
              child: IconButton(
                onPressed: viewModel.record,
                icon: const Icon(Icons.mic),
                padding: const EdgeInsets.all(24),
                color: theme.colorScheme.onPrimary,
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AudioRecorderWaveform(
                        controller: viewModel.controller,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Consumer(builder: (_, ref, __) {
                      final duration = ref.watch(viewModel.currentDuration);
                      return duration.when(
                        loading: () => const CircularProgressIndicator(),
                        error: (error, stackTrace) => Text(error.toString()),
                        data: (value) => Text(value.toHHMMSS()),
                      );
                    }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => viewModel.stop(),
                      icon: const Icon(Icons.delete),
                    ),
                    IconButton(
                      onPressed: viewModel.toggle,
                      icon: Icon(
                        state == RecorderState.recording
                            ? Icons.pause_circle
                            : Icons.mic,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        viewModel.pause();
                        _showSaveRecordingDialog(context, ref).then(
                          (value) => viewModel.stop(value),
                        );
                      },
                      icon: const Icon(Icons.save),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}

class _AudioRecorderViewModel extends StateNotifier<RecorderState?> {
  _AudioRecorderViewModel(this.recordings) : super(null);

  final Recordings recordings;

  late final String _path;

  late final RecorderController controller = RecorderController()
    ..androidEncoder = AndroidEncoder.aac
    ..androidOutputFormat = AndroidOutputFormat.mpeg4
    ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
    ..sampleRate = 44100
    ..onRecorderStateChanged.listen((event) {
      state = event;
      debugPrint("onRecorderStateChanged: $event");
    });

  late final currentDuration = StreamProvider.autoDispose(
    (ref) => controller.onCurrentDuration,
  );

  void initialize() async {
    final cacheDirs = await getExternalCacheDirectories();
    if (cacheDirs?.isNotEmpty == false) return null;
    final appDirectory = cacheDirs!.first;
    _path = "${appDirectory.path}/recording.m4a";
    state = RecorderState.initialized;
  }

  Future<void> record() async => await controller.record(path: _path);

  Future<void> pause() async => await controller.pause();

  Future<void> toggle() async {
    if (state == RecorderState.recording) {
      await pause();
    } else if (state == RecorderState.paused) {
      await record();
    }
  }

  void stop([String? title]) async {
    var path = await controller.stop();
    if (title != null) {
      final source = File(path!);
      final directory = await getExternalStorageDirectory();
      final destination = await source.rename('${directory?.path}/$title.m4a');
      path = destination.path;
      recordings.add(path);
    }
    debugPrint(path);
    controller.refresh();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

Future<String> _showSaveRecordingDialog(
    BuildContext context, WidgetRef ref) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      final form = GlobalKey<FormState>();
      final controller = TextEditingController(
          text: "Recording ${ref.read(recordingsProvider).length + 1}");
      return AlertDialog(
        title: const Text("Save Recording"),
        content: Form(
          key: form,
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'File name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'File name cannot be empty';
              }
              return null;
            },
            controller: controller,
          ),
        ),
        actions: [
          OnboardingButton(
            text: 'Save',
            onPressed: () {
              if (form.currentState?.validate() == true) {
                Navigator.pop(context, controller.text);
              }
            },
          ),
        ], //
      );
    },
  );
}
