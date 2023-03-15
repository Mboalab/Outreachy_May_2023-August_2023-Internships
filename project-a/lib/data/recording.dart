import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final recordingsProvider =
StateNotifierProvider.autoDispose<Recordings, List<Recording>>(
  (ref) => Recordings()..initialize(),
);

class Recordings extends StateNotifier<List<Recording>> {
  Recordings() : super([]);

  void initialize() async {
    final source = await getExternalStorageDirectory();
    if (source == null) return;

    state = Directory(source.path)
        .listSync()
        .map((file) => Recording(file.path))
        .toList();
  }

  bool hasName(String name) => state.any((recording) => recording.name == name);

  String newRecordingName() {
    var index = state.length + 1;
    while (hasName('Recording $index')) {
      ++index;
    }
    return 'Recording $index';
  }

  void add(String path) {
    state = [...state, Recording(path)];
  }

  void remove(String path) {
    state = [...state]..removeWhere((item) => item.path == path);
    File(path).deleteSync();
  }
}

class Recording {
  Recording(this.path);

  static const extension = 'm4a';

  final String path;

  late final String name = File(path)
      .path
      .split(Platform.pathSeparator)
      .last
      .replaceAll(".$extension", '')
      .trim();
}
