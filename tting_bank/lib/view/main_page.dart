import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_template.dart';

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
        leading: Icon(Icons.menu),
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: Row(
            children: [
              Icon(Icons.search),
            ],
          ),
        ),
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
