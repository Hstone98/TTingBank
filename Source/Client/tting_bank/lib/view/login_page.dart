import 'package:flutter/material.dart';
import 'package:tting_bank/conttoller/login_page_controller.dart';
import 'package:tting_bank/view/main_page.dart';
import 'package:tting_bank/conttoller/profile_controller.dart';
import 'package:tting_bank/conttoller/userdata_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      TokenCheck().then((isValid) {
        if (isValid) {
          setState(() {
            isLoggedIn = true;
          });
          didChangeDependencies();
        }
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainPage()), // MainPage로 이동
      );
    }
  }

  //이메일, 이름 비동기로 받아올때까지 기다림
  void initUserSave() async {
    await save(await KakaoEmail(), await KakaoName()); //카카오 로그인된 사용자 저장
    //await save('testuser@naver.com', 'testuser'); //testuser 사용자 저장
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffbf5f1),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200),
            Container(
              child: Image.asset(
                'assets/images/im_rogo.png',
              ),
            ),
            SizedBox(height: 130),
            Row(
              children: [
                Text(
                  '     카카오톡 계정으로 간편 로그인',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            ElevatedButton(
              onPressed: () async => {
                if (await btnLogin())
                  {
                    debugPrint('넘어가'),
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainPage()), // MainPage로 이동
                    ),
                    initUserSave() //DB로 사용자 데이터 전송
                  }
                else
                  {
                    debugPrint('ssibal'),
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('로그인 실패!!'),
                        content: const Text('로그인 정보를 확인해주세요.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                  }
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
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Text(
                  'TTing Card',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'TTing ver.2    Capstone',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
