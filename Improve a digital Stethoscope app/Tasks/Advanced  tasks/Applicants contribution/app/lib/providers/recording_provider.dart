import 'dart:developer';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class RecordingProvider extends ChangeNotifier {
  int fileCount = 0;
  var filesInFolder = [];
  List<String> filesToBePlayed = [];
  bool isRecording = false;
  bool isPaused = false;

  Future<String> getDirPath() async {
    Directory? appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    return appDocPath;
  }

  Future<String> getFolderPath() async {
    Directory? appDocDir = await getExternalStorageDirectory();
    String appDocPath = appDocDir!.path;
    return appDocPath;
  }

  Future<List<FileSystemEntity>> getFilesList() async {
    String folderPath = await getFolderPath();
    Directory directory = Directory(folderPath);
    List<FileSystemEntity> filesList = directory.listSync();
    return filesList;
  }

  Future<void> getFilesInFolder(VoidCallback updateState) async {
    List<FileSystemEntity> files = await getFilesList();
    List<String> filesAdded = [];
    List<String> filesAdded2 = [];

    for (FileSystemEntity file in files) {
      String fileName = p.basename(file.path);
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
          int.parse(fileName.replaceAll('.mp3', '')));

      String formattedDate = DateFormat('dd MMM, hh:mm').format(dateTime);

      filesAdded.add(formattedDate);

      filesAdded2.add(fileName);
    }
    filesInFolder = filesAdded;
    filesToBePlayed = filesAdded2;
  }

  void countFiles() async {
    List<FileSystemEntity> files = await getFilesList();
    fileCount = files.length;
  }

  void startListening(VoidCallback updateState) async {
    Directory dir = Directory(await getFolderPath());
    dir.watch().listen((event) {
      if (event.type == FileSystemEvent.create) {
        countFiles();
        getFilesInFolder(updateState);
        updateState();
      }
      if (event.type == FileSystemEvent.delete) {
        countFiles();
        getFilesInFolder(updateState);
        updateState();
      }
    });
  }

  Future<void> startRecording(
      RecorderController recorderController, VoidCallback updateState) async {
    String appDocPath = await getDirPath();
    String recordingFilePath =
        '$appDocPath/${DateTime.now().millisecondsSinceEpoch}.mp3';
    await recorderController.record(path: recordingFilePath);
    isRecording = true;
    updateState();
  }

  Future<void> stopRecording(
      RecorderController recorderController, VoidCallback updateState) async {
    final file = await recorderController.stop();

    isRecording = false;
    updateState();
    final savedRecordingPath = await _saveRecordingToLocalFile(file!);
    getFilesInFolder(() => updateState);
    log('Saved recording to $savedRecordingPath');
  }

  Future<String> _saveRecordingToLocalFile(String recordingFilePath) async {
    // Get the app documents directory path
    Directory? appDocDir = await getExternalStorageDirectory();
    String? appDocPath = appDocDir?.path;
    // Generate a new file name for the recording
    String fileName = '${DateTime.now().millisecondsSinceEpoch}.mp3';
    // Combine the app documents directory path and the new file name
    String filePath = '$appDocPath/$fileName';
    // Copy the recording file from the audio_waveform package's cache to the local file
    File(recordingFilePath).copy(filePath);
    // Return the file path where the recording was saved
    return filePath;
  }

  void playRecordedFile(
      PlayerController playerController, VoidCallback updateState) async {
    await playerController.startPlayer(finishMode: FinishMode.pause);
    isPaused = true;
    updateState();
  }

  void pauseRecordedFile(
      PlayerController playerController, VoidCallback updateState) async {
    await playerController.pausePlayer();
    isPaused = false;
    updateState();
  }

  void deleteRecordedFile(String audioFile, VoidCallback updateState) async {
    String folderPath = await getFolderPath();
    final String filePath = p.join(folderPath, audioFile);
    final file = File(filePath);

    file.deleteSync();
    getFilesInFolder(() => updateState);
  }
}
