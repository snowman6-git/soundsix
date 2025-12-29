import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:soundsix/song_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title}); //this를 걸어야 초기화가 됌
  final String title; //그래야 파이널로 걸 수 있음
  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State<MainPage> {
  int _currentIndex = 0;

  // 갈아끼울수 있는 페이지들(바텀 내비로)
  final List<Widget> _children = [
    const HomePage(),
    const SongPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sound:Six")), // 헤더 고정
      body: _children[_currentIndex], // 칠드런 변수안의 인덱스 기반으로 호출 (리스트라 이해 ㄱ)
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green, // 선택된 아이콘 색상
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Song'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Playlist'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My'),
        ],
      ),
    );
  }
}
