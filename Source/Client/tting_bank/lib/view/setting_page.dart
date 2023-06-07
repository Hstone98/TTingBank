import 'package:flutter/material.dart';
import 'package:tting_bank/conttoller/profile_controller.dart';
import 'package:tting_bank/conttoller/userdata_controller.dart';
import 'package:tting_bank/view/login_page.dart';

import '../conttoller/login_page_controller.dart';
import '../conttoller/userid_controller.dart';
import '../model/user.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({
    Key? key,
  }) : super(key: key);

  @override
  SettingPageState createState() => SettingPageState();
}

User user = User(id: 0, name: '', email: '', connected_id: ''); //사용자 정보

class SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    super.initState();
    initUser();
  }

  //받은 비동기 User를 User형태로 name에 저장하고 상태를 저장-> user에 대한 데이터를 가져오고 거래내역 조회
  Future<void> initUser() async {
    User userInfo = await userSet(await KakaoName()); //실제 사용자 정보 받아오는 거

    setState(() {
      user = userInfo;
    });
  }

  List<String> mainList = [
    '내 정보 수정하기',
    '내 자산',
    '고객센터',
    '로그아웃',
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
      title: '로그아웃',
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
                      user.name, //받아온 사용자 이름 출력
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
    return Material(
      color: Theme.of(context).cardColor, // ListTile의 배경색으로 설정
      child: InkWell(
        onTap: () {
          if (title == '내 정보 수정하기') {
            // '내 정보 수정하기'를 클릭했을 때 수행할 동작
            // TODO: 동작 구현
          } else if (title == '내 자산') {
            // '내 자산'을 클릭했을 때 수행할 동작
            // TODO: 동작 구현
          } else if (title == '고객센터') {
            // '고객센터'를 클릭했을 때 수행할 동작
            // TODO: 동작 구현
          } else if (title == '로그아웃') {
            // '고객센터'를 클릭했을 때 수행할 동작
            // TODO: 동작 구현
            LogoutshowConfirmationDialog(context);
          } else if (title == '탈퇴하기') {
            // '탈퇴하기'를 클릭했을 때 수행할 동작
            showConfirmationDialog(context);
          } else if (title == '앱 버전 ver 1.0') {
            // '앱 버전 ver 1.0'을 클릭했을 때 수행할 동작
            // TODO: 동작 구현
          }
        },
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
        ),
      ),
    );
  }

  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('탈퇴하기'), // 다이얼로그 제목
          content: Text('정말로 탈퇴하시겠습니까?'), // 다이얼로그 내용
          actions: [
            TextButton(
              onPressed: () {
                // 예를 선택한 경우 탈퇴처리
                withdrawUser(user.email); //탈퇴기능
                Kakao_Withdrawal();
                Navigator.of(context).pop(); // 다이얼로그 닫기
                Navigator.pushAndRemoveUntil(
                    //모든 화면 pop 후 LoginPage push
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                    (route) => false);
              },
              child: Text('예'), // 예 버튼 텍스트
            ),
            TextButton(
              onPressed: () {
                // 아니오를 선택한 경우 취소됨

                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: Text('아니오'), // 아니오 버튼 텍스트
            ),
          ],
        );
      },
    );
  }

  void LogoutshowConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('로그아웃'), // 다이얼로그 제목
          content: Text('정말로 로그아웃 하시겠습니까?'), // 다이얼로그 내용
          actions: [
            TextButton(
              onPressed: () {
                // 예를 선택한 경우 로그아웃
                Kakao_Withdrawal();
                Navigator.of(context).pop(); // 다이얼로그 닫기
                Navigator.pushAndRemoveUntil(
                    //모든 화면 pop 후 LoginPage push
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                    (route) => false);
              },
              child: Text('예'), // 예 버튼 텍스트
            ),
            TextButton(
              onPressed: () {
                // 아니오를 선택한 경우 취소됨

                Navigator.of(context).pop(); // 다이얼로그 닫기
              },
              child: Text('아니오'), // 아니오 버튼 텍스트
            ),
          ],
        );
      },
    );
  }
}
