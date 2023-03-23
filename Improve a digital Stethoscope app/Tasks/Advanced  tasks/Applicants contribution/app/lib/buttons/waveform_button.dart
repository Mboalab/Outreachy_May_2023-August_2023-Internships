// ignore: file_names
import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:mboathoscope/providers/recording_provider.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';

class WaveformButton extends StatefulWidget {
  final bool isRecordingBtn;
  final String? file;

  const WaveformButton({super.key, this.isRecordingBtn = false, this.file});

  @override
  State<WaveformButton> createState() => _WaveformButtonState();
}

class _WaveformButtonState extends State<WaveformButton>
    with WidgetsBindingObserver {
  late final RecorderController recorderController;
  late final PlayerController playerController;

  Future<void> getFilePath() async {
    String filePath = await context.read<RecordingProvider>().getFolderPath();
    playerController.preparePlayer(path: p.join(filePath, widget.file));
  }

  void _initialiseController() {
    recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 16000;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initialiseController();
    playerController = PlayerController();
    getFilePath();
  }

  void _disposeOfControllers() {
    playerController.dispose();
    recorderController.dispose();
  }

  @override
  void dispose() {
    _disposeOfControllers();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(ui.AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      _disposeOfControllers();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    bool rec = context.watch<RecordingProvider>().isRecording;
    bool isPaused = context.watch<RecordingProvider>().isPaused;
    return !widget.isRecordingBtn
        ? Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              color: const Color(0xffF3F7FF),
              border: Border.all(color: Colors.black),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      maxRadius: 15.0,
                      backgroundColor: isPaused
                          ? const ui.Color.fromARGB(255, 222, 62, 59)
                          : Colors.black26,
                      child: IconButton(
                        color: Colors.white,
                        iconSize: 15,
                        icon: Icon(
                          isPaused ? Icons.pause : Icons.play_arrow,
                          color:
                              isPaused ? Colors.white : const Color(0xff3D79FD),
                        ),
                        onPressed: () {
                          isPaused
                              ? context
                                  .read<RecordingProvider>()
                                  .pauseRecordedFile(
                                      playerController, () => setState(() {}))
                              : context
                                  .read<RecordingProvider>()
                                  .playRecordedFile(
                                      playerController, () => setState(() {}));
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 85,
                  child: AudioFileWaveforms(
                    size: Size(MediaQuery.of(context).size.width, 20.0),
                    playerController: playerController,
                    enableSeekGesture: true,
                    waveformType: WaveformType.long,
                    playerWaveStyle: PlayerWaveStyle(
                        fixedWaveColor: Colors.blueGrey.shade800,
                        liveWaveColor: Colors.blueGrey,
                        waveCap: StrokeCap.butt,
                        spacing: 6,
                        seekLineColor: Colors.black),
                  ),
                )
              ],
            ),
          )
        : Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: AudioWaveforms(
                      enableGesture: true,
                      size:
                          Size(MediaQuery.of(context).size.width * 0.50, 40.0),
                      recorderController: recorderController,
                      waveStyle: WaveStyle(
                        gradient: ui.Gradient.linear(
                          const Offset(70, 50),
                          Offset(MediaQuery.of(context).size.width / 2, 0),
                          [Colors.red, Colors.green],
                        ),
                        waveColor: Colors.black,
                        middleLineColor: Colors.black,
                        showDurationLabel: true,
                        extendWaveform: true,
                        showMiddleLine: false,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () async {
                        rec
                            ? await context
                                .read<RecordingProvider>()
                                .stopRecording(
                                    recorderController, () => setState(() {}))
                            : await context
                                .read<RecordingProvider>()
                                .startRecording(
                                    recorderController, () => setState(() {}));
                       
                      },
                      child: Image.asset(
                        'assets/images/img_record.png',
                        color: rec ? Colors.red : Colors.blue,
                        fit: BoxFit.cover,
                        height: 70,
                        width: 70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
