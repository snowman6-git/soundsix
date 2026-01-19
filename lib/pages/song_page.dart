import 'package:flutter/material.dart';
import 'package:soundsix/components/song_tile.dart';
import 'package:soundsix/models/music_data.dart';
import 'package:soundsix/lib/songlist.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});
  @override
  Widget build(BuildContext context) {
    // 1. 데이터 준비 (Svelte의 let songs = [...])

    var songlist = selectMusicFolder();
    print(songlist);

    final List<MusicData> dummySongs = [
      MusicData(
        title: "Here is title",
        artist: "some artist",
        albumArt: "",
        duration: "2:37", //나중에 꼭 연산해서 넣게 하기
      ),
    ];
    // 2. UI 렌더링 (Svelte의 {#each})
    return Scaffold(
      backgroundColor: Colors.black, // 음악 앱은 검은 배경
      body: ListView.builder(
        itemCount: dummySongs.length,
        itemBuilder: (context, index) {
          // 오브젝트 넘기기: music_tile 컴포넌트에 데이터 주입
          return MusicListItem(music: dummySongs[index]);
        },
      ),
    );
  }
}
