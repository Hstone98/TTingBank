import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tting_bank/data/category.dart';

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
            backgroundColor: Colors.white,
            leading: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            title: Text('Category', style: TextStyle(color: Colors.black)),
            bottom: TabBar(
                indicatorColor: Colors.black,
                indicatorWeight: 2.0,
                isScrollable: true,
                controller: _tabController,
                tabs: [
                  Tab(
                    child: Text('패스트푸드', style: TextStyle(color: Colors.black)),
                  ),
                  Tab(
                    child: Text('카페', style: TextStyle(color: Colors.black)),
                  ),
                  Tab(
                    child: Text(
                      '음식점',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      '영화',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      '빵집',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      '한식',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      '중식',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      '일식',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            Container(color: Colors.grey[300], child: StoreListScreen()),
            Container(
                color: Colors.grey[300],
                child: StoreListScreen() //메소드로 추가한 가맹점리스트
                ),
            Container(color: Colors.grey[300], child: StoreListScreen()),
            Container(color: Colors.grey[300], child: StoreListScreen()),
            Container(color: Colors.grey[300], child: StoreListScreen()),
            Container(color: Colors.grey[300], child: StoreListScreen()),
            Container(color: Colors.grey[300], child: StoreListScreen()),
            Container(color: Colors.grey[300], child: StoreListScreen())
          ]),
        ));
  }
}

class StoreListScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 20),
            child: Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10) //모서리를 둥글게
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
                  borderRadius: BorderRadius.circular(10) //모서리를 둥글게
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
                  borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                  ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 20),
            child: Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10) //모서리를 둥글게
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
                  borderRadius: BorderRadius.circular(10) //모서리를 둥글게
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
                  borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                  ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 20),
            child: Container(
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10) //모서리를 둥글게
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
                  borderRadius: BorderRadius.circular(10) //모서리를 둥글게
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
                  borderRadius: BorderRadius.circular(10) //모서리를 둥글게
                  ),
            ),
          ),
        ],
      )
    ]);
  }
}
