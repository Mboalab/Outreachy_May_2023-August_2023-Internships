import 'dart:async';
import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path/path.dart' as path;
import 'package:intl/intl.dart' show DateFormat;
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/date_symbol_data_local.dart';

class RecordUtil {
  static FlutterSoundRecorder? _myRecorder;
  static final _audioPlayer = AssetsAudioPlayer();
  static String? _filePath;

  static void startIt() async {
    _myRecorder = FlutterSoundRecorder();

    await Permission.microphone.request();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
    _filePath = '/sdcard/Thoescope/';
    Directory dir = Directory(_filePath!);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
    }

    await _myRecorder!.openAudioSession(
        focus: AudioFocus.requestFocusAndStopOthers,
        category: SessionCategory.playAndRecord,
        mode: SessionMode.modeDefault,
        device: AudioDevice.speaker);
    await _myRecorder!
        .setSubscriptionDuration(const Duration(milliseconds: 10));
    await initializeDateFormatting();
  }

  static Future<bool> record() async {
    try {
      _myRecorder!.openAudioSession();
      await _myRecorder!.startRecorder(
        toFile: '$_filePath${DateTime.now().millisecondsSinceEpoch}.wav',
        codec: Codec.pcm16WAV,
      );

      StreamSubscription recorderSubscription =
          _myRecorder!.onProgress!.listen((e) {
        var date = DateTime.fromMillisecondsSinceEpoch(
            e.duration.inMilliseconds,
            isUtc: true);
        var txt = DateFormat('mm:ss:SS', 'en_GB').format(date);
      });
      recorderSubscription.cancel();
      print("Audio recorded successfully");
      return _myRecorder!.isRecording;
    } catch (error) {
      print("Errorrrr====================++++++++++++++++++>");
      print(error);
      return false;
    }
  }

  static Future<String?> stopRecord() async {
    _myRecorder!.closeAudioSession();
    return await _myRecorder!.stopRecorder();
  }

  static Future<void> openRecording(String recordPath) async {
    _audioPlayer.open(
      Audio.file(recordPath),
      showNotification: true,
    );
  }

  static void play(){
    _audioPlayer.play();
  }

  static void pause(){
    _audioPlayer.pause();
  }

  static Future<void> stopPlaying() async {
    _audioPlayer.stop();
  }

  static Future<List<FileSystemEntity>> getRecordigs() async {
    try {
      Directory recordings = Directory('/sdcard/Thoescope/');
      List<FileSystemEntity> files = await recordings.list().toList();
      return files;
    } catch (error) {
      print(error);
      return [];
    }
  }
}
