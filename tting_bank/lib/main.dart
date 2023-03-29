import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'kakaologin/kakao_init.dart';
import 'package:tting_bank/view/main_page.dart';
import 'view/login_page.dart';
import 'view/setting_page.dart';

void main() {
  KakaoInit();
  runApp(
    MaterialApp(
      home: SettingPage(),
    ),
  );
}
