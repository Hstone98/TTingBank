import 'package:flutter/material.dart';
import 'package:tting_bank/view/assetmanagement_page.dart';
import 'package:tting_bank/view/cardInfo_page.dart';
import 'package:tting_bank/view/recommend_page.dart';
import 'package:tting_bank/view/assetmanagement_page.dart';
import 'package:flutter/material.dart';
import 'kakaologin/kakao_init.dart';
import 'package:tting_bank/view/main_page.dart';
import 'package:tting_bank/view/store_list_page.dart';
import 'package:tting_bank/view/consumption_details.dart';
import 'package:tting_bank/view/consumption_details.dart';
import 'view/login_page.dart';
import 'view/setting_page.dart';
import 'package:tting_bank/view/splash_screen.dart';

void main() {
  KakaoInit();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      home: LoginPage(),
    ),
  );
}
