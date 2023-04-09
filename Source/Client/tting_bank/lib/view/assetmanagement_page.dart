import 'package:flutter/material.dart';

//소비 총액, 캐시백 총액,
class AssetmanagementPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
            );
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Asset Manamgement",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Menu 1'),
              onTap: () {
                // 갈곳 지정
              },
            ),
            ListTile(
              title: Text('Menu 2'),
              onTap: () {
                // 갈곳 지정
              },
            ),
            ListTile(
              title: Text('Menu 3'),
              onTap: () {
                // 갈곳 지정
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        //오버플로우 나는거 해결
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Cashback This Month',
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10), //간격 추가.
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '156,000 Won', //후에 여기 들어갈 값 변경
                      style: TextStyle(
                        fontSize: 29,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 30,
                  thickness: 4,
                  color: Colors.black,
                ),
              ],
            ),
            SizedBox(height: 80), //간격 추가
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      '2월 소비',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5), //간격 추가
                Row(
                  children: [
                    Text(
                      '2,518,647원', //후에 여기 들어갈 값 변경
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 30,
                  thickness: 0.5,
                  color: Colors.black,
                ),
              ],
            ),
            SizedBox(height: 30), //간격 추가
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      '2월 캐쉬백',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5), //간격 추가
                Row(
                  children: [
                    Text(
                      '2,518,647원', //후에 여기 들어갈 값 변경
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 30,
                  thickness: 0.1,
                  color: Colors.black,
                ),
              ],
            ),
            SizedBox(height: 30), //간격 추가
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      '2월 ???',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5), //간격 추가
                Row(
                  children: [
                    Text(
                      '2,518,647원', //후에 여기 들어갈 값 변경
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Divider(
                  height: 30,
                  thickness: 0.5,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
