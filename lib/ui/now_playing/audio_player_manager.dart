import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class AudioPlayerManager {
  AudioPlayerManager._internal();
  static final AudioPlayerManager _instance = AudioPlayerManager._internal();
  factory AudioPlayerManager() => _instance;

  final player = AudioPlayer();
  Stream<DurationState>? durationState;
  String songUrl = "";

  void prepare() {
    durationState = Rx.combineLatest2(
        player.positionStream, player.playbackEventStream, (position,
        playbackEvent) =>
        DurationState(progress: position,
            buffered: playbackEvent.bufferedPosition,
            total: playbackEvent.duration));
    player.setUrl(songUrl);
  }
  void updateSongUrl(String url){
    songUrl = url;
    prepare();
  }
  void dispose(){
    player.dispose();
  }
}
class DurationState {
  const DurationState({
    required this.progress,
    required this.buffered,
    this.total,
  });

  final Duration progress;
  final Duration buffered;
  final Duration? total;
}