import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key, required this.title}); //this를 걸어야 초기화가 됌
  final String title; //그래야 파이널로 걸 수 있음
  @override
  State<StatefulWidget> createState(){
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  var _index = 0; //메뉴를 담기 위한 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //위
      appBar: AppBar(
        title: Text(widget.title),
      ),

      //중간
      body: const Center(
        // child: Text('Hello, Flutter!'),
      ),

      //밑
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index, //현재 골라진 메뉴
        type: BottomNavigationBarType.fixed, //3개 이상으로 하려면 필수
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Song'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Playlist'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My'),
        ],),
    );
  }
}