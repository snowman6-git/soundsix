import 'package:flutter/material.dart';
import 'package:soundsix/models/music_data.dart';
import 'package:audioplayers/audioplayers.dart'; // 패키지 임포트




class MusicListItem extends StatelessWidget {
  // [부모 위젯으로부터 받을 데이터]
  // 생성자를 통해 MusicData 객체를 통째로 넘겨받음
  final MusicData music; //models에 있는 클래스의 구조를 json의 흔한구조처럼 key.value처럼 가져오게 선언
  const MusicListItem({
    super.key,
    required this.music, // 부모에서 MusicListItem(music: 데이터) 식으로 넘겨줘야 함
  });

  @override
  Widget build(BuildContext context) {
    bool isPlaying = false;
    final AudioPlayer _audioPlayer = AudioPlayer();

    void _playMusic() async {
      if (isPlaying) {
        await _audioPlayer.pause();
      } else {
        // assets 폴더에 있는 파일 재생
        _audioPlayer.play(AssetSource('music/${music.title}.mp3'));
      }
      // setState(() {
      //
      // });
    }


    return InkWell(
      onTap: () {
        _playMusic();
        isPlaying = !isPlaying;
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey[900], // 음악 앱 느낌의 다크한 배경
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            // 1. 앨범 아트 (둥근 모서리 적용)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                music.albumArt,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                // 이미지 로딩 실패 시 보여줄 기본 아이콘
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 50,
                  height: 50,
                  color: Colors.grey[800],
                  child: const Icon(Icons.music_note, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 16),

            // 2. 곡 정보 (제목, 아티스트)
            Expanded(
              // 텍스트가 길어져도 화면 밖으로 안 나가게 조절
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    music.title, // [모델 사용] 제목
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, // 길면 ... 처리
                  ),
                  const SizedBox(height: 4),
                  Text(
                    music.artist, // [모델 사용] 아티스트
                    style: TextStyle(color: Colors.grey[400], fontSize: 13),
                  ),
                ],
              ),
            ),

            // 3. 재생 시간
            Text(
              music.duration, // [모델 사용] 시간
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),

            const SizedBox(width: 8),
            // 더보기 버튼 같은 거 하나 있으면 예쁨
            Icon(Icons.more_vert, color: Colors.grey[600], size: 20),
          ],
        ),
      ),
    );

  }
}
