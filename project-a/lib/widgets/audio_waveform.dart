import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';

class AudioRecorderWaveform extends StatelessWidget {
  const AudioRecorderWaveform({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final RecorderController controller;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return AudioWaveforms(
          enableGesture: true,
          size: Size(constraints.maxWidth, 30.0),
          recorderController: controller,
          waveStyle: const WaveStyle(
            waveColor: Colors.black,
            middleLineColor: Colors.black,
            extendWaveform: true,
          ),
        );
      },
    );
  }
}

class AudioPlayerWaveform extends StatelessWidget {
  const AudioPlayerWaveform({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PlayerController controller;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return AudioFileWaveforms(
          size: Size(constraints.maxWidth, 50.0),
          playerController: controller,
          enableSeekGesture: true,
          waveformType: WaveformType.long,
          waveformData: const [],
          playerWaveStyle: const PlayerWaveStyle(
            fixedWaveColor: Colors.white54,
            liveWaveColor: Colors.blueAccent,
            spacing: 6,
          ),
        );
      },
    );
  }
}
