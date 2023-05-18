import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_auth.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';

Future<String>? KakaoEmail() async {
  try {
    User user = await UserApi.instance.me();
    return user.kakaoAccount?.email ?? '';
  } catch (error) {
    print('사용자 정보 요청 실패 $error');
    return '';
  }
}

Future<String?> KakaoName() async {
  try {
    User user = await UserApi.instance.me();
    return user.kakaoAccount?.profile?.nickname;
  } catch (error) {
    print('사용자 정보 요청 실패 $error');
    return null;
  }
}

Future<String?> KakaoImage() async {
  try {
    TalkProfile profile = await TalkApi.instance.profile();
    return profile.thumbnailUrl;
  } catch (error) {
    print('카카오톡 프로필 받기 실패 $error');
    return null;
  }
}
