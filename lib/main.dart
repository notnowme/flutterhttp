import 'dart:io';

import 'package:flutter/material.dart';
import 'package:toon/screens/home_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  // api를 요청할 때
  // 헤더가 모바일이라, 봇이나 부정적인 방법으로 인식하는 듯함.
  // 그걸 브라우저에서 보내는 걸로 userAgent를 바꿔줘야 함.
  // 글로벌로 적용함.
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..userAgent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36';
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
