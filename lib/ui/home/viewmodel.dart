import 'dart:async';

import 'package:music_app/data/model/song.dart';
import 'package:music_app/data/reponsitory/reponsitory.dart';

class MusicAppViewModel {
  StreamController<List<Song>> songStream = StreamController();

  void loadSongs() {
    final repository = DefaultReponsitory();
    repository.loadData().then((value) => songStream.add(value!));
  }
}
