import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:mboathoscope/utils/record_util.dart';

class WaveformButton extends StatefulWidget {
  String? recordPath;
  WaveformButton({Key? key, this.recordPath}) : super(key: key);

  @override
  State<WaveformButton> createState() => _WaveformButtonState();
}

class _WaveformButtonState extends State<WaveformButton> {
  late final RecorderController recorderController;
  var _isPlaying = false;
  var _isRecordingOpen = false;
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
    _initialiseController();
  }

  @override
  Widget build(BuildContext context) {
    late final PlayerController playerController;
    return Container(
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
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: const Color(0xff3D79FD),
                  ),
                  onPressed: () {
                    if (!_isRecordingOpen) {
                      RecordUtil.openRecording(widget.recordPath!);
                      _isRecordingOpen = true;
                    }
                    if (_isPlaying) {
                      RecordUtil.pause();
                    } else {
                      RecordUtil.play();
                    }
                    setState(() {
                      _isPlaying = !_isPlaying;
                    });
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
              recorderController: recorderController,
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
    );
  }
}
/*

void _startRecording() async {
  await recorderController.record(path);
  // update state here to, for eample, change the button's state
}
void _stopRecording() async {
  final path = await recorderController.stop();
}*/
