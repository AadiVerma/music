import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music/models/song.dart';

class playList extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
        songName: "On Top",
        artistName: "Karan Aujla",
        albumArtImagePath: "asset/images/download.jpeg",
        audioPath: "asset/audio/karanaujla.mp3"),
    Song(
        songName: "Paradise",
        artistName: "Sukhan Verma",
        albumArtImagePath: "asset/images/download1.jpeg",
        audioPath: "asset/audio/download1.mp3"),
    Song(
        songName: "Chandigarh ka Chokra",
        artistName: "Sunanda Sharma",
        albumArtImagePath: "asset/images/download2.jpeg",
        audioPath: "asset/audio/download2.mp3"),
    Song(
        songName: "Has Has",
        artistName: "Diljit Dosanjh",
        albumArtImagePath: "asset/images/download3.jpeg",
        audioPath: "asset/audio/download3.mp3"),
    Song(
        songName: "Check It Out",
        artistName: "Parmish Verma",
        albumArtImagePath: "asset/images/download4.jpeg",
        audioPath: "asset/audio/download4.mp3"),
    // Audio player
  ];
  final AudioPlayer _audioplayer = AudioPlayer();
  // durations
  Duration _current = Duration.zero;
  Duration _total = Duration.zero;

  //constructor
  playList() {
    listenToDuration();
  }
  //initially not playing
  bool _isplaying = false;
  // play the song
  void play() async {
    await _audioplayer.stop();
    await _audioplayer.play(AssetSource('audio/download1.mp3'));
    _isplaying = true;
    notifyListeners();
  }

  // pause the current
  void pause() async {
    await _audioplayer.pause();
    _isplaying = false;
    notifyListeners();
  }

  //resume playing
  void resume() async {
    await _audioplayer.resume();
    _isplaying = true;
    notifyListeners();
  }

  // pause and resume
  void playOrResume() {
    if (_isplaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // seek to a specific position
  void seek(Duration position) async {
    _audioplayer.seek(position);
  }

  // play next song
  void playNext() {
    if (currentSongIndex != null) {
      if (currentSongIndex! < _playlist.length - 1) {
        currentSongIndex = currentSongIndex! + 1;
      } else {
        currentSongIndex = 0;
      }
    }
  }

  //play previous song
  void playprevious() async {
    if (_current.inSeconds > 2) {
    } else {
      if (currentSongIndex! > 0) {
        _currentSongIndex = _currentSongIndex! - 1;
      } else {
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  //listen to duration
  void listenToDuration() {
    // listen for total durations
    _audioplayer.onDurationChanged.listen((newdurations) {
      _total = newdurations;
      notifyListeners();
    });
    // listen for current durations
    _audioplayer.onPositionChanged.listen((newposition) {
      _current = newposition;
      notifyListeners();
    });
    // listen for song complete
    _audioplayer.onPlayerComplete.listen((event) {
      playNext();
    });
  }

  // dispose audio player
  int? _currentSongIndex;
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  Duration get current => _current;
  bool get isplaying => _isplaying;
  Duration get total => _total;

  set currentSongIndex(int? newindex) {
    _currentSongIndex = newindex;
    if (newindex != null) {
      play();
    }
    notifyListeners();
  }
}
