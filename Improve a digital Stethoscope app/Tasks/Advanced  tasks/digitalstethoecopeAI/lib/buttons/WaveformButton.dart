import 'dart:developer';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class WaveformButton extends StatefulWidget {
  final bool isRecordingBtn;

  const WaveformButton({super.key, this.isRecordingBtn = false});

  @override
  State<WaveformButton> createState() => _WaveformButtonState();
}

class _WaveformButtonState extends State<WaveformButton> {
  late final RecorderController _recorderController;
  late final PlayerController playerController1;
  String? _path;
  late Directory appDirectory;
  bool isRecording = false;
  String? musicFile;

  void _initialiseController() {
    _recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 16000;

    playerController1 = PlayerController()
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
  }

  @override
  void initState() {
    super.initState();
    _getDir();
    _initialiseController();
  }

  void _getDir() async {
    appDirectory = await getApplicationDocumentsDirectory();
    // _preparePlayers();
    _path = "${appDirectory.path}/music.acc";
    log("This is the getDir: $_path");
  }

  void _startOrStopRecording() async {
    if (isRecording) {
      _recorderController.reset();
      final path = await _recorderController.stop(false);
      log("$path");
      // if (path != null) await playerController5.preparePlayer(path);
    } else {
      await _recorderController.record(path: _path);
    }
    setState(() {
      isRecording = !isRecording;
    });
  }

  Future<ByteData> _loadAsset(String _path) async {
    return await rootBundle.load(_path);
  }

  void _preparePlayers() async {
    ///audio-1
    final file1 = File('${appDirectory.path}/audio1.mp3');
    await file1.writeAsBytes(
        (await _loadAsset('assets/audios/audio1.mp3')).buffer.asUint8List());
    playerController1.preparePlayer(path:file1.path);
  }
  //   @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.detached) {
  //     _disposeControllers();
  //   }
  //   super.didChangeAppLifecycleState(state);
  // }

  @override
  Widget build(BuildContext context) {
    late final PlayerController playerController;
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
                      backgroundColor: Colors.black,
                      child: IconButton(
                        color: Colors.white,
                        iconSize: 15,
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Color(0xff3D79FD),
                        ),
                        onPressed: () {
                          // do something
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 85,
                  child: AudioWaveforms(
                    enableGesture: true,
                    size: Size(MediaQuery.of(context).size.width, 20.0),
                    recorderController: _recorderController,
                    waveStyle: const WaveStyle(
                      waveColor: Colors.black,
                      middleLineColor: Colors.black,
                      showDurationLabel: true,
                      extendWaveform: true,
                      showMiddleLine: true,
                    ),
                  ),
                ),
              ],
            ),
          )
        :

        // ),
        Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              // color: Colors.blueGrey,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: AudioWaveforms(
                      enableGesture: true,
                      // size: Size(MediaQuery.of(context).size.width / 2, 40.0),
                      size:
                          Size(MediaQuery.of(context).size.width * 0.50, 40.0),
                      recorderController: _recorderController,

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
                  InkWell(
                    onTap: _startOrStopRecording,
                    child: Expanded(
                      flex: 2,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/img_record.png',
                          color: isRecording ? Colors.red : Colors.blue,
                          fit: BoxFit.cover,
                          height: 70,
                          width: 70,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

//  IconButton(
//           onPressed: _startOrStopRecording,
//           icon: Icon(isRecording ? Icons.stop : Icons.mic),
//           color: isRecording ? Colors.red : Colors.blue,
//           iconSize: 28,
//         ),

// https://morioh.com/p/05b40963b708
// https://blog.logrocket.com/audio-waveforms-flutter-app/
