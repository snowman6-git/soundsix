import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // 패키지 임포트

class PlayPage extends StatefulWidget {
  const PlayPage({super.key});

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  // 1. 플레이어 인스턴스 생성
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void dispose() {
    _audioPlayer.dispose(); // 앱 끄면 메모리 해제 필수
    super.dispose();
  }

  // 2. 재생 함수
  void _playMusic() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      // assets 폴더에 있는 파일 재생
      await _audioPlayer.play(AssetSource('music/test.mp3'));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        iconSize: 64,
        icon: Icon(
          isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
          color: Colors.white,
        ),
        onPressed: _playMusic,
      ),
    );
  }
}