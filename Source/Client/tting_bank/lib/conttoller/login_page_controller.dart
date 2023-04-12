import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_auth.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';

Future<OAuthToken?> LoginKakao() async {
  bool isInstalled = await isKakaoTalkInstalled();
  OAuthToken? token;

  if (isInstalled) {
    try {
      token = await UserApi.instance.loginWithKakaoTalk();
      debugPrint('카카오톡으로 로그인 성공');
    } catch (error) {
      debugPrint('카카오톡으로 로그인 실패 $error');

      // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
      // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
      if (error is PlatformException && error.code == 'CANCELED') {
        return null;
      }
      // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
      try {
        token = await UserApi.instance.loginWithKakaoAccount();
        debugPrint('카카오계정으로 로그인 성공');
        debugPrint('성공이야1');
      } catch (error) {
        debugPrint('카카오계정으로 로그인 실패 $error');
        debugPrint('실패야1');
      }
    }
  }
  //카카오톡이 설치가 안되어있는 경우 카카오 계정으로 로그인
  else {
    try {
      token = await UserApi.instance.loginWithKakaoAccount();
      debugPrint('카카오계정으로 로그인 성공');
      debugPrint('성공이야2');
    } catch (error) {
      debugPrint('카카오계정으로 로그인 실패 $error');
      debugPrint('실패야2');
    }
  }

  return token;
}

Future<void> Kakao_Withdrawal() async {
  try {
    await UserApi.instance.unlink();
    print('연결 끊기 성공, SDK에서 토큰 삭제');
  } catch (error) {
    print('연결 끊기 실패 $error');
  }
}

Future<bool> TokenCheck() async {
  if (await AuthApi.instance.hasToken()) {
    try {
      AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
      print('토큰 유효성 체크 성공 ${tokenInfo.id} ${tokenInfo.expiresIn}');
      return true;
    } catch (error) {
      if (error is KakaoException && error.isInvalidTokenError()) {
        print('토큰 만료 $error');
      } else {
        print('토큰 정보 조회 실패 $error');
      }
      return false;
    }
  }
  return false;
}

Future<bool> btnLogin() async{
  if (await LoginKakao() == null) {
    debugPrint('실패야3');
    return false;
  } else {
    // TODO : token data를 DB에 전송하는 코드. 전송 완료됐을 때, 페이지 전환.
    // 토큰 정보 : 이메일, 이름.
    debugPrint('성공이야3');
    return true;
  }
}
