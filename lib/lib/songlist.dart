import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

Future<List<File>> selectMusicFolder() async {
  // 1. 현재 권한 상태 확인
  var status = await Permission.manageExternalStorage.status;
  if (status.isGranted) {
  } else {
    // 2. 권한 요청 (설정 화면으로 이동됨)
    await Permission.manageExternalStorage.request();
  }

  // 1. 유저에게 폴더 선택창 띄우기
  String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
  if (selectedDirectory == null) {
    // 유저가 선택을 취소한 경우
    return [];
  }
  // 2. 선택된 경로의 디렉토리 객체 생성
  final directory = Directory(selectedDirectory);
  // 3. 폴더 안의 파일들 긁어오기
  // listSync(recursive: false)는 해당 폴더 직속 파일만 가져옴
  final List<FileSystemEntity> entities = directory.listSync();
  return entities
      .whereType<File>()
      .where((file) => file.path.endsWith('.mp3'))
      .toList();
}