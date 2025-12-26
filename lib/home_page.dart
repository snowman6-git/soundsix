import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title}); //this를 걸어야 초기화가 됌
  final String title; //그래야 파이널로 걸 수 있음
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  final _index = 0; //메뉴를 담기 위한 변수
  bool _isoutDoor = false;
  bool _isDataSaver = false;
  //final String lastPlayed = "untitled song";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //위
      appBar: AppBar(title: Text(widget.title)),

      //중간
      body: Column(
        children: [
          // 리:다이브
          AspectRatio(
            aspectRatio: 16 / 9, // 가로 16 : 세로 9 비율 유지
            child: Container(
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
              ),
              //컬럼 넣고 페딩 넣고 안에 컬럼넣다가 그럼 그냥 파딩 하나 넣고 안에 컬럼으로 칠드런 하면 되는거 아니냐 어쩌구 저쩌구 해서 최적화를 한 코드, 플러터하면서 성장이 돋보인다(평가자: Gemini(아님))
              child: Padding(
                padding: EdgeInsets.only(bottom: 10, left: 20, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'RE:DIVE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'noname - untitled song',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 많이 들은 곡 + 최근 추가곡
          Row(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.0, // 1:1 비율
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      left: 20,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue, // 눈에 띄게 색상 추가
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10, left: 20, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Most:DIVE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'noname - MostPlayed song',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.0, // 1:1 비율
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      left: 10,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue, // 눈에 띄게 색상 추가
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10, left: 20, right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recent added',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'noname - recentadded song',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 아웃도어(앨범 + 제목 가리기 모드)
              Expanded(
                child: AspectRatio(
                  aspectRatio: 21 / 9,
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      left: 20,
                      right: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 2.0),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          _isoutDoor = !_isoutDoor;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _isoutDoor ? 'Out Door' : 'In Door',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Switch(
                            value: _isoutDoor,
                            onChanged: (value) {
                              setState(() {
                                _isoutDoor = value;
                              });
                            },
                            thumbIcon: WidgetStateProperty.resolveWith<Icon?>((Set<WidgetState> states) {
                              if (states.contains(WidgetState.selected)) {
                                return const Icon(Icons.business); // 켜졌을 때 아이콘
                              }
                              return const Icon(Icons.home); // 꺼졌을 때 아이콘 (필요 없으면 null)
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // 저데이터 모드(음원 압축을 하건 뭐건 알아서 ㄱㄱ)
              Expanded(
                child: AspectRatio(
                  aspectRatio: 21 / 9,
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      left: 10,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 2.0),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          _isDataSaver = !_isDataSaver;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _isDataSaver ? 'FullStream' : 'DataSaver',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Switch(
                            value: _isDataSaver,
                            activeTrackColor: Colors.green,
                            thumbIcon: WidgetStateProperty.resolveWith<Icon?>((Set<WidgetState> states) {
                              if (states.contains(WidgetState.selected)) {
                                return const Icon(Icons.speed); // 꺼졌을 때 아이콘 (필요 없으면 null)
                              }
                              return const Icon(Icons.eco); // 켜졌을 때 아이콘
                            }),
                            onChanged: (value) {
                              setState(() {
                                _isDataSaver = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          //뭐넣지(후보: 노래추가)
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2.0),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
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
        ],
      ),
    );
  }
}
