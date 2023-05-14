import 'package:flutter/material.dart';
import 'package:tting_bank/conttoller/profile_controller.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({
    Key? key,
  }) : super(key: key);

  @override
  SettingPageState createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage> {
  List<String> mainList = [
    '내 정보 수정하기',
    '내 자산',
    '고객센터',
    '탈퇴하기',
    '앱 버전 ver 1.0',
  ];

  List<Widget> listItemWidgets = [
    ListTileItem(
      icon: Icons.edit,
      title: '내 정보 수정하기',
    ),
    ListTileItem(
      icon: Icons.account_balance_wallet,
      title: '내 자산',
    ),
    ListTileItem(
      icon: Icons.phone,
      title: '고객센터',
    ),
    ListTileItem(
      icon: Icons.cancel,
      title: '탈퇴하기',
    ),
    ListTileItem(
      icon: Icons.info,
      title: '앱 버전 ver 1.0',
    ),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "설정",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.white,
        child: Column(
          children: [
            Card(
              elevation: 8,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: FutureBuilder<String?>(
                        future: KakaoImage(),
                        builder: (BuildContext context,
                            AsyncSnapshot<String?> snapshot) {
                          if (snapshot.hasData) {
                            return CircleAvatar(
                              backgroundImage: NetworkImage(snapshot.data!),
                              radius: 50,
                            );
                          } else if (snapshot.hasError) {
                            return CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/im_white.png'),
                              radius: 60,
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '회원 이름',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListView.separated(
                  itemCount: listItemWidgets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return listItemWidgets[index];
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 20); // 리스트 항목 사이의 여백 추가
                  },
                ),
              ),
            ),
            SizedBox(height: 60), // 아래에 추가할 여백
          ],
        ),
      ),
    );
  }
}

class ListTileItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const ListTileItem({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Icon(icon),
      title: Text(title),
    );
  }
}
