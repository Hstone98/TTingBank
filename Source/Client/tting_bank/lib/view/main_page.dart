import 'dart:async';

import 'package:tting_bank/conttoller/search_controller.dart';

import '../data/search_store.dart';
import 'assetmanagement_page.dart';
import 'cardInfo_page.dart';
import 'cashback_this_month_tting.dart';

import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_template.dart';
import 'package:tting_bank/view/recommend_page.dart';
import 'package:tting_bank/view/setting_page.dart';
import 'package:tting_bank/conttoller/main_page_controller.dart';
import 'package:tting_bank/view/store_list_page.dart';
import 'package:tting_bank/data/category.dart';
import 'package:tting_bank/data/image_category.dart';
import 'package:tting_bank/view/registercard_page.dart';
import 'package:tting_bank/conttoller/profile_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CardInfoPage()),
                  );
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CashbackThisMonthTting()),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RecommendPage()));
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
                              // ListTile을 클릭했을 때 수행할 작업 추가
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
                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 0, 20),
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
                              if (2 * i + 1 < ImageCategory.listAsset.length)
                                setSizeBox(
                                  ImageCategory.listAsset[2 * i + 1],
                                  CategoryType.values[2 * i + 1],
                                  context,
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
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 30, 0, 10),
                          child: Text(
                            "My Card",
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 0, 0),
                                  child: Image.asset(
                                    'bankTting/img/testcard1.png',
                                    width: 300,
                                    height: 220,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 0, 0),
                                  child: Image.asset(
                                    'bankTting/img/testcard2.png',
                                    width: 300,
                                    height: 220,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 0, 0),
                                  child: Image.asset(
                                    'bankTting/img/testcard3.png',
                                    width: 300,
                                    height: 220,
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.transparent, // 배경색을 투명하게 설정
                                    shape: RoundedRectangleBorder(
                                      // 라운드 코너 제거
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    elevation: 0, // 물방울 효과 제거
                                  ),
                                  onPressed: () {
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
