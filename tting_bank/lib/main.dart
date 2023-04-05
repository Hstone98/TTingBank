import 'package:flutter/material.dart';
import 'package:tting_bank/view/assetmanagement_page.dart';
import 'package:tting_bank/view/cardInfo_page.dart';
import 'package:tting_bank/view/recommend_page.dart';
import 'package:tting_bank/view/assetmanagement_page.dart';
import 'package:flutter/material.dart';
import 'kakaologin/kakao_init.dart';
import 'package:tting_bank/view/main_page.dart';
import 'view/login_page.dart';
import 'view/setting_page.dart';

void main() {
  KakaoInit();
  runApp(
    MaterialApp(
      home: AssetmanagementPage(),
    ),
  );
}
