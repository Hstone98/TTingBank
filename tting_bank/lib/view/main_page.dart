import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_template.dart';
import 'package:tting_bank/view/recommend_page.dart';
import 'package:tting_bank/view/setting_page.dart';
import 'assetmanagement_page.dart';
import 'cardInfo_page.dart';
import 'cashback_this_month_tting.dart';
import 'package:tting_bank/conttoller/main_page_controller.dart';
import 'package:tting_bank/view/store_list_page.dart';
import 'package:tting_bank/data/category.dart';

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
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(30, 50, 0, 20),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => (StoreListPage(
                                  categoryType: CategoryType.movie,
                                ))),
                      )
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent, // 배경색을 투명하게 설정
                      shape: RoundedRectangleBorder(
                        // 라운드 코너 제거
                        borderRadius: BorderRadius.circular(0),
                      ),
                      elevation: 0, // 물방울 효과 제거
                    ),
                    child: Image.asset(
                      'assets/images/kakao_login.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 7, 0),
                  child: Image.asset('bankTting/img/testimg1.png',
                      width: 70, height: 70),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(7, 0, 7, 0),
                  child: Image.asset('bankTting/img/testimg2.png',
                      width: 70, height: 70),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(7, 0, 7, 0),
                  child: Image.asset('bankTting/img/testimg3.png',
                      width: 70, height: 70),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(7, 0, 0, 0),
                  child: Image.asset('bankTting/img/testimg4.png',
                      width: 70, height: 70),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 7, 40),
                  child: Image.asset('bankTting/img/testimg5.png',
                      width: 70, height: 70),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(7, 20, 7, 40),
                  child: Image.asset('bankTting/img/testimg6.png',
                      width: 70, height: 70),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(7, 20, 7, 40),
                  child: Image.asset('bankTting/img/testimg7.png',
                      width: 70, height: 70),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(7, 20, 0, 40),
                  child: Image.asset('bankTting/img/testimg8.png',
                      width: 70, height: 70),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 1.0,
                  width: 500.0,
                  color: Colors.black,
                )
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 50, 0, 0),
                  child: Image.asset('bankTting/img/testcard.png',
                      width: 300, height: 220),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
