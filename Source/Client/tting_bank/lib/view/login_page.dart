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
  @override
  void initState() {
    super.initState();
    TokenCheck().then((isValid) {
      if (isValid) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
        set(); //DB로 사용자 데이터 전송
      }
    });
  }

  //이메일, 이름 비동기로 받아올때까지 기다림
  void set() async {
    String? email = await KakaoEmail();
    String? name = await KakaoName();
    print(email);
    print(name);
    await saveUser(email, name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 120),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/TTing Card.png',
                  fit: BoxFit.cover,
                ),
                // Text(
                //   'TTingCard',
                //   style: TextStyle(
                //       fontSize: 50,
                //       color: Colors.grey[800],
                //       fontWeight: FontWeight.bold),
                // ),
              ],
            ),
            SizedBox(height: 40),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    ),
                    set() //DB로 사용자 데이터 전송
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
            SizedBox(height: 300),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
