import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tting_bank/data/category.dart';
import 'package:tting_bank/data/image_category.dart';
import 'package:tting_bank/view/recommend_page.dart';

class StoreListPage extends StatefulWidget {
  CategoryType? categoryType;

  StoreListPage({Key? key, this.categoryType}) : super(key: key);

  @override
  _storeListPage createState() => new _storeListPage(this.categoryType);
}

class _storeListPage extends State<StoreListPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  CategoryType? categoryType;
  String title = '가맹점';

  _storeListPage(this.categoryType);

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
        vsync: this, length: 8, initialIndex: categoryType!.index);

    // super.initState();
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
            leading: ElevatedButton(
                onPressed: () => {Navigator.pop(context)},
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            backgroundColor: Colors.white,
            title: Text(title, style: TextStyle(color: Colors.black)),
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
                ]),
          ),
          body: TabBarView(controller: _tabController, children: [
            Container(
                color: Colors.grey[300],
                child: StoreListScreen(ImageCategory.listStoreCafe)),
            Container(
                color: Colors.grey[300],
                child: StoreListScreen(ImageCategory.listStoreMovie)),
            Container(
                color: Colors.grey[300],
                child: StoreListScreen(ImageCategory.listStoreConvenience))
            // Container(color: Colors.grey[300], child: StoreListScreen(ImageCategory.listStoreCafe)),
            // Container(color: Colors.grey[300], child: StoreListScreen(ImageCategory.listStoreCafe)),
            // Container(color: Colors.grey[300], child: StoreListScreen(ImageCategory.listStoreCafe))
          ]),
        ));
  }
}

class StoreListScreen extends StatelessWidget {
  List? listStore;

  StoreListScreen(this.listStore);

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
                createColumn(listStore!, i, context),
            ],
          ),
        ),
      ],
    );
  }
}

Widget createColumn(List listStore, int index, BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(1),
    child: ElevatedButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecommendPage(),
          ),
        )
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white, // Background color
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
