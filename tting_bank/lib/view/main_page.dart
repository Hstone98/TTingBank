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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30, 50, 0, 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                Column(
                  children: [
                    getsizebox(),getsizebox()
                  ]
                ),
                Column(
                  children: [
                    getsizebox(),getsizebox()
                  ]
                ),
                Column(
                  children: [
                    getsizebox(),getsizebox()
                  ]
                ),
                  Column(
                  children: [
                    getsizebox(),getsizebox()
                  ]
                ),
                
              ]
              )
              
            )
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



    );
  }
}
Widget getsizebox(){
  return SizedBox(
                      width: 110,
                      height: 110,
                      child: ElevatedButton(
                        onPressed: Clickme,
                        // () => {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => (StoreListPage(
                          //             categoryType: CategoryType.cafe,
                          //           ))),
                          // )
                        // },     //아이콘 누르면 카테고리에 해당 카테고리 탭뷰로 가는 버튼 구현 해야댐

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent, // 배경색을 투명하게 설정
                          shape: RoundedRectangleBorder(
                            // 라운드 코너 제거
                            borderRadius: BorderRadius.circular(0),
                          ),
                          elevation: 0, // 물방울 효과 제거
                        ),
                        child: Image.asset(
                          'bankTting/img/testimg1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
}

void Clickme(){
  print('클릭됨');
}//네이게이션 버튼 작동 구현 못해서 일단 클릭 확인하려고 만든 함수 