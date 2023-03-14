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

  void add(String path) {
    state = [...state, Recording(path)];
  }

  void remove(String path) {
    final data = state;
    data.removeWhere((item) => item.path == path);
    state = data;
  }
}

class Recording {
  final String path;

  const Recording(this.path);

  String get name => File(path).path.split(Platform.pathSeparator).last;
}
