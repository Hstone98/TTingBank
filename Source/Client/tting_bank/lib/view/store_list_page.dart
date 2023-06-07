import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tting_bank/data/category.dart';
import 'package:tting_bank/data/image_category.dart';
import 'package:tting_bank/model/user.dart';
import 'package:tting_bank/view/recommend_page.dart';

class StoreListPage extends StatefulWidget {
  CategoryType? categoryType;
  final User user;

  StoreListPage({Key? key, this.categoryType, required this.user}) : super(key: key);

  @override
  _StoreListPageState createState() => _StoreListPageState(categoryType, user);
}

class _StoreListPageState extends State<StoreListPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  CategoryType? categoryType;
  User user;
  String title = '가맹점';

  _StoreListPageState(this.categoryType, this.user);

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      vsync: this,
      length: 3,
      initialIndex: categoryType!.index,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.white,
          title: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
          bottom: TabBar(
            indicatorColor: Colors.black,
            indicatorWeight: 2.0,
            isScrollable: true,
            controller: _tabController,
            tabs: [
              //TODO: 배열 생성해서 동적으로 만들어지도록 구현.
              //TODO: 카테고리 내용은 데이터베이스에서 가져오도록 구현.
              //TODO: 여행 카테고리 추가 및 메인페이지에서 여행 누르면 이동하도록 수정
              Tab(
                child: Text('카페', style: TextStyle(color: Colors.black)),
              ),
              Tab(
                child: Text(
                  '영화',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text('편의점', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(
              color: Colors.grey[300],
              child: StoreListScreen(
                listStore: ImageCategory.listStoreCafe,
                allList: ImageCategory.CafeNameList,
                user: user, // user 전달
              ),
            ),
            Container(
              color: Colors.grey[300],
              child: StoreListScreen(
                listStore: ImageCategory.listStoreMovie,
                allList: ImageCategory.MovieNameList,
                user: user, // user 전달
              ),
            ),
            Container(
              color: Colors.grey[300],
              child: StoreListScreen(
                listStore: ImageCategory.listStoreConvenience,
                allList: ImageCategory.ConvenienceNameList,
                user: user, // user 전달
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoreListScreen extends StatelessWidget {
  List? listStore;
  List allList;
  User user; // user 추가

  StoreListScreen({
    required this.listStore,
    required this.allList,
    required this.user, // user 전달 받음
  });

  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(20),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 4,
            children: <Widget>[
              for (int i = 0; i < listStore!.length; i++)
                createColumn(listStore!, allList[i], i, context, user), // user 전달
            ],
          ),
        ),
      ],
    );
  }
}

Widget createColumn(
    List listStore,
    String name,
    int index,
    BuildContext context,
    User user, // user 매개변수 추가
    ) {
  return Container(
    padding: const EdgeInsets.all(1),
    child: ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecommendPage(name, user),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
      ),
      child: Image.asset(
        listStore[index].toString(),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Row createStoreRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 20),
        child: Container(
          width: 90.0,
          height: 90.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10), //모서리를 둥글게
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 20),
        child: Container(
          width: 90.0,
          height: 90.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10), //모서리를 둥글게
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 20),
        child: Container(
          width: 90.0,
          height: 90.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10), //모서리를 둥글게
          ),
        ),
      ),
    ],
  );
}
