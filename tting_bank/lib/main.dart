import 'package:flutter/material.dart';
import 'package:tting_bank/view/assetmanagement_page.dart';
import 'package:tting_bank/view/cardInfo_page.dart';
import 'package:tting_bank/view/recommend_page.dart';
import 'package:tting_bank/view/assetmanagement_page.dart';
import 'package:flutter/material.dart';
import 'kakaologin/kakao_init.dart';
import 'package:tting_bank/view/main_page.dart';
import 'package:tting_bank/view/store_list_page.dart';
import 'package:tting_bank/view/cashback_this_month_tting.dart';
import 'package:tting_bank/view/consumption_details.dart';
<<<<<<< HEAD
=======

import 'view/login_page.dart';
import 'view/setting_page.dart';
>>>>>>> master

void main() {
  KakaoInit();
  runApp(
    MaterialApp(
<<<<<<< HEAD
      home: CashbackThisMonthTting(),
=======
      home: AssetmanagementPage(),
>>>>>>> master
    ),
  );
}
