import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_template.dart';
import 'package:tting_bank/conttoller/main_page_controller.dart';
import 'package:tting_bank/conttoller/profile_controller.dart';
import 'package:tting_bank/conttoller/search_controller.dart';
import 'package:tting_bank/conttoller/user_card_controller.dart';
import 'package:tting_bank/conttoller/userid_controller.dart';
import 'package:tting_bank/data/category.dart';
import 'package:tting_bank/data/image_category.dart';
import 'package:tting_bank/data/search_store.dart';
import 'package:tting_bank/model/card_info.dart';
import 'package:tting_bank/model/user.dart';
import 'package:tting_bank/view/assetmanagement_page.dart';
import 'package:tting_bank/view/cardInfo_page.dart';
import 'package:tting_bank/view/consumption_details.dart';
import 'package:tting_bank/view/registercard_page.dart';
import 'package:tting_bank/view/recommend_page.dart';
import 'package:tting_bank/view/setting_page.dart';
import 'package:tting_bank/view/store_list_page.dart';

var testname = 'test';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

User user = User(id: 0, name: '', email: '', connected_id: ''); //사용자 정보
List<CardInfo> card = []; //사용자가 보유한 카드 정보
List<String> imageName = []; //카드의 이미지에 대한 정보

class _MainPageState extends State<MainPage> {
  TextEditingController _searchController = TextEditingController();
  bool _showClearButton = false;
  StreamController<List<Store>> _searchResultsController =
      StreamController<List<Store>>.broadcast();
  Stream<List<Store>> get _searchResultsStream =>
      _searchResultsController.stream;

  void _searchTextChanged() async {
    String searchText = _searchController.text;
    if (searchText.isNotEmpty) {
      List<Store> searchResults = await search(searchText);
      _searchResultsController.add(searchResults);
    }
    setState(() {
      _showClearButton = searchText.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchTextChanged);
    initUser();
    initUserCard();
    Refresh.cardInfoChangedStream.listen((_) {
      setState(() {
        initUserCard();
      });
    });
  }

  @override
  void dispose() {
    _searchResultsController.close();
    _searchController.dispose();
    super.dispose();
  }

  void _clearSearchText() {
    setState(() {
      _searchController.clear();
      _searchResultsController.add([]); // 검색 결과를 비워줍니다.
      _showClearButton = false;
    });
  }

  //받은 비동기 User를 User형태로 name에 저장하고 상태를 저장-> user에 대한 데이터를 가져오고 거래내역 조회
  Future<void> initUser() async {
    User userInfo = await userSet(await KakaoName()); //실제 사용자 정보 받아오는 거
    //User userInfo = await userSet('testuser'); //test 사용자 정보 받아오는 거

    setState(() {
      user = userInfo;
      print('user id : ' + user.id.toString());
    });
    initUserCard();
  }

  Future<void> initUserCard() async {
    List<CardInfo> cardInfo = await userCard(user.id); //실제 사용자가 보유한 카드정보 받아오는 거

    setState(() {
      card = cardInfo;
    });
    cardPath();
  }

  //받아온 카드이름을 경로로 변환
  Future<void> cardPath() async {
    for (int i = 0; i < card.length; i++) {
      imageName.add('bankTting/img/' + card[i].cardName.toString() + '.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //색변경
          ),
          backgroundColor: Colors.white,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              FutureBuilder<String?>(
                future: KakaoName(),
                builder: (BuildContext context,
                    AsyncSnapshot<String?> nameSnapshot) {
                  return FutureBuilder<String>(
                    future: KakaoEmail(),
                    builder: (BuildContext context,
                        AsyncSnapshot<String> emailSnapshot) {
                      String? kakaoName = nameSnapshot.data;
                      String? kakaoEmail = emailSnapshot.data;
                      return FutureBuilder<String?>(
                        future: KakaoImage(),
                        builder: (BuildContext context,
                            AsyncSnapshot<String?> imageSnapshot) {
                          String? kakaoImage = imageSnapshot.data;
                          return UserAccountsDrawerHeader(
                            currentAccountPicture: CircleAvatar(
                              backgroundImage: kakaoImage != null
                                  ? NetworkImage(kakaoImage)
                                  : AssetImage('assets/images/im_white.png')
                                      as ImageProvider,
                            ),
                            accountName: Text(
                              kakaoName ?? '이름 없음',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            accountEmail: Text(
                              kakaoEmail ?? '이메일 없음',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40.0),
                                bottomRight: Radius.circular(40.0),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
              ListTile(
                title: Text(
                  '소비 및 캐시백 총액',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  // leading은 맨 처음을 기준으로 붙여줌
                  Icons.attach_money,
                  color: Colors.grey[850],
                ),
                selected: true,
                onTap: () {
                  // Server로 UserId 전달.
                  SendUserId(user.id);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AssetmanagementPage()),
                  );
                },
                trailing: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
              ListTile(
                title: Text(
                  '카드사 로그인',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  // leading은 맨 처음을 기준으로 붙여줌
                  Icons.login,
                  color: Colors.grey[850],
                ),
                selected: true,
                onTap: () {
                  // Server로 UserId 전달.
                  SendUserId(user.id);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterCardPage()),
                  );
                },
                trailing: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
              ListTile(
                title: Text(
                  '카드 등록',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  // leading은 맨 처음을 기준으로 붙여줌
                  Icons.add_card,
                  color: Colors.grey[850],
                ),
                selected: true,
                onTap: () {
                  // Server로 UserId 전달.
                  SendUserId(user.id);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CardInfoPage()),
                  );
                  Refresh.addCardInfoChangedEvent(true);
                },
                trailing: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
              ListTile(
                title: Text(
                  '나의 소비 내역',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  // leading은 맨 처음을 기준으로 붙여줌
                  Icons.settings_accessibility,
                  color: Colors.grey[850],
                ),
                selected: true,
                onTap: () {
                  // Server로 UserId 전달.
                  SendUserId(user.id);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ConsumptionThisMonth()),
                  );
                },
                trailing: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
              ListTile(
                title: Text(
                  '카드 추천',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  // leading은 맨 처음을 기준으로 붙여줌
                  Icons.card_giftcard,
                  color: Colors.grey[850],
                ),
                selected: true,
                onTap: () {
                  // Server로 UserId 전달.
                  SendUserId(user.id);

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecommendPage(testname, user)));
                },
                trailing: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
              ListTile(
                title: Text(
                  '설정',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  // leading은 맨 처음을 기준으로 붙여줌
                  Icons.settings,
                  color: Colors.grey[850],
                ),
                selected: true,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingPage()));
                },
                trailing: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.search),
                        color: Colors.grey,
                        onPressed: () {},
                      ),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '검색',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      if (_showClearButton)
                        IconButton(
                          icon: Icon(Icons.clear),
                          color: Colors.grey,
                          onPressed: _clearSearchText,
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              StreamBuilder<List<Store>>(
                stream: _searchResultsController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Store> searchResults = snapshot.data!;
                    // 검색 결과를 사용하여 UI 구성
                    return Column(
                      children: [
                        for (var store in searchResults)
                          ListTile(
                            title: Text(store.name),
                            subtitle:
                                Text('ID: ${store.id}, Type: ${store.type}'),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RecommendPage(store.name, user),
                                ),
                              );
                            },
                          ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    // 에러 처리
                    return Text('오류 발생: ${snapshot.error}');
                  } else {
                    // 로딩 중 상태 처리
                    return Container();
                  }
                },
              ),
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
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
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(30, 20, 0, 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0;
                            i < (ImageCategory.listAsset.length + 1) ~/ 2;
                            i++)
                          Column(
                            children: [
                              if (2 * i < ImageCategory.listAsset.length)
                                setSizeBox(
                                  ImageCategory.listAsset[2 * i],
                                  CategoryType.values[2 * i],
                                  context,
                                ),
                              if (i == 0)
                                Text(
                                  "카페",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              if (i == 1)
                                Text(
                                  "편의점",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              if (i == 2)
                                Text(
                                  "주유소",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              if (2 * i + 1 < ImageCategory.listAsset.length)
                                setSizeBox(
                                  ImageCategory.listAsset[2 * i + 1],
                                  CategoryType.values[2 * i + 1],
                                  context,
                                ),
                              if (i == 0)
                                Text(
                                  "영화관",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              if (i == 1)
                                Text(
                                  "여행",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              if (i == 2)
                                Text(
                                  "호텔/리조트",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...imageName
                                    .toSet()
                                    .map((image) => Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Image.asset(
                                            image!,
                                            width: 300,
                                            height: 220,
                                          ),
                                        ))
                                    .toList(),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    // Server로 UserId 전달.
                                    SendUserId(user.id);

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CardInfoPage()),
                                    );
                                  },
                                  child: Image.asset(
                                    'bankTting/img/cardplus.PNG',
                                    width: 300,
                                    height: 220,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

//------------------------------------------------------------------------------------------------//
//
//------------------------------------------------------------------------------------------------//
Widget setSizeBox(String strImgPath, CategoryType type, BuildContext context) {
  return SizedBox(
    width: 90,
    height: 90,
    child: ElevatedButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StoreListPage(
              categoryType: type,
              user: user,
            ),
          ),
        )
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        elevation: 0,
      ),
      child: Image.asset(
        strImgPath,
        fit: BoxFit.fill,
      ),
    ),
  );
}

class Refresh {
  static StreamController<bool> _cardInfoChangedController =
      StreamController<bool>.broadcast();

  static Stream<bool> get cardInfoChangedStream =>
      _cardInfoChangedController.stream;

  static void addCardInfoChangedEvent(bool value) {
    _cardInfoChangedController.add(value);
  }
}
