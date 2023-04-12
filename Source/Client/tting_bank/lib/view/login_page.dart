import 'package:flutter/material.dart';
import 'package:tting_bank/conttoller/login_page_controller.dart';
import 'package:tting_bank/view/main_page.dart';

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
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KakaoTalk Login')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async => {
                if (await btnLogin())
                  {
                    debugPrint('넘어가'),
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    )
                  }
                else
                  {
                    debugPrint('씨발'),
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Kakao_Withdrawal(),
              child: Text('회원탈퇴'),
            ),
          ],
        ),
      ),
    );
  }
}
