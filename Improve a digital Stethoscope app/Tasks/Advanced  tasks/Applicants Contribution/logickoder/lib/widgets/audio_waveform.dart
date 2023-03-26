import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';

const _height = 30.0;

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
          size: Size(constraints.maxWidth, _height),
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
    this.waveFormData = const [],
  }) : super(key: key);

  final PlayerController controller;
  final List<double> waveFormData;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return AudioFileWaveforms(
          size: Size(constraints.maxWidth, _height),
          playerController: controller,
          enableSeekGesture: true,
          waveformType: WaveformType.long,
          waveformData: waveFormData,
          playerWaveStyle: const PlayerWaveStyle(
            fixedWaveColor: Colors.black,
            liveWaveColor: Colors.black,
            seekLineColor: Colors.black,
            spacing: 6,
          ),
        );
      },
    );
  }
}
