import 'package:flutter/material.dart';
import 'pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sound:Six',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   textTheme: TextTheme()
      // ),

      theme: ThemeData(
        // 1. 앱 전체 배경색과 앱바 색상도 여기서 미리 정의 가능
        scaffoldBackgroundColor: const Color(0xFF121212),
        textTheme: const TextTheme(
          // 큰 제목 (AppBar 등)
          titleLarge: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          // 중간 크기 제목 (리스트 타이틀 등)
          bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
          // 일반 본문 (아티스트 이름 등)
          bodyMedium: TextStyle(color: Color(0xFFBBBBBB), fontSize: 14),
        ),
      ),

      home: const MainPage(title: "Sound:Six"),
    );
  }
}
