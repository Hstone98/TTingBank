import 'assetmanagement_page.dart';
import 'cardInfo_page.dart';
import 'cashback_this_month_tting.dart';

import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_template.dart';
import 'package:tting_bank/view/recommend_page.dart';
import 'package:tting_bank/view/setting_page.dart';
import 'package:tting_bank/conttoller/main_page_controller.dart';
import 'package:tting_bank/view/store_list_page.dart';
import 'package:tting_bank/data/category.dart';
import 'package:tting_bank/data/image_category.dart';
import 'package:tting_bank/view/registercard_page.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //색변경
        ),
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: Row(
            children: [
              Icon(Icons.search),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(children: <Widget>[
          ListTile(
            title: Text('소비 및 캐시백 총액'),
            leading: FlutterLogo(),
            selected: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AssetmanagementPage()),
              );
            },
          ),
          ListTile(
            title: Text('카드사 로그인'),
            leading: FlutterLogo(),
            selected: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterCardPage()),
              );
            },
          ),
          ListTile(
            title: Text('카드등록'),
            leading: FlutterLogo(),
            selected: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CardInfoPage()),
              );
            },
          ),
          ListTile(
            title: Text('나의 소비 내역'),
            leading: FlutterLogo(),
            selected: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CashbackThisMonthTting()),
              );
            },
          ),
          ListTile(
            title: Text('카드 추천'),
            leading: FlutterLogo(),
            selected: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecommendPage()),
              );
            },
          ),
          ListTile(
            title: Text('설정'),
            leading: FlutterLogo(),
            selected: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingPage()),
              );
            },
          ),
        ]),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30, 50, 0, 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < (ImageCategory.listAsset.length + 1) ~/ 2; i++)
                    Row(
                      children: [
                        Column(
                          children: [
                            if (2 * i < ImageCategory.listAsset.length)
                              setSizeBox(ImageCategory.listAsset[2 * i], CategoryType.values[2 * i], context),
                            if (2 * i + 1 < ImageCategory.listAsset.length)
                              setSizeBox(ImageCategory.listAsset[2 * i + 1], CategoryType.values[2*i+1], context),
                          ],
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(
                height: 1.0,
                width: 500.0,
                color: Colors.black,
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 50, 0, 0),
                child: Image.asset(
                  'bankTting/img/testcard.png',
                  width: 300,
                  height: 220,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//------------------------------------------------------------------------------------------------//
//
//------------------------------------------------------------------------------------------------//
Widget setSizeBox(String strImgPath, CategoryType type, BuildContext context) {
  return SizedBox(
    width: 110,
    height: 110,
    child: ElevatedButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoreListPage(
              categoryType: type,
            ),
          ),
        )
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        elevation: 0,
      ),
      child: Image.asset(
        strImgPath,
        fit: BoxFit.fill,
      ),
    ),
  );
}