import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_auth.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';

Future<String>? KakaoEmail() async {
  try {
    User user = await UserApi.instance.me();
    print('사용자 정보 요청 성공'
        '\n회원번호: ${user.id}'
        '\n이메일: ${user.kakaoAccount?.email}');
    return user.kakaoAccount?.email ?? '';
  } catch (error) {
    print('사용자 정보 요청 실패 $error');
    return '';
  }
}

Future<String?> KakaoName() async {
  try {
    User user = await UserApi.instance.me();
    print('사용자 정보 요청 성공'
        '\n회원번호: ${user.id}'
        '\n닉네임: ${user.kakaoAccount?.profile?.nickname}');
    return user.kakaoAccount?.profile?.nickname;
  } catch (error) {
    print('사용자 정보 요청 실패 $error');
    return null;
  }
}

Future<String?> KakaoImage() async {
  try {
    TalkProfile profile = await TalkApi.instance.profile();
    print('카카오톡 프로필 받기 성공'
        '\n프로필사진: ${profile.thumbnailUrl}');
    return profile.thumbnailUrl;
  } catch (error) {
    print('카카오톡 프로필 받기 실패 $error');
    return null;
  }
}
