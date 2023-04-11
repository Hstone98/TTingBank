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
            leading: ElevatedButton(
                onPressed: () => {Navigator.pop(context)},
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            title: Text('Category', style: TextStyle(color: Colors.black)),
            bottom: TabBar(
            indicatorColor: Colors.black,
            indicatorWeight: 2.0,
            isScrollable: true,
            controller: _tabController,
            tabs: [
              //TODO: 배열 생성해서 동적으로 만들어지도록 구현.
              //TODO: 카테고리 내용은 데이터베이스에서 가져오도록 구현.
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
              Tab(
                child: Text(
                  '음식점',
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
            ]),
          ),
          body: TabBarView(controller: _tabController, children: [
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
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[100],
                child: const Text("He'd have you all unravel at the"),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[200],
                child: const Text('Heed not the rabble'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[300],
                child: const Text('Sound of screams but the'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[400],
                child: const Text('Who scream'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[500],
                child: const Text('Revolution is coming...'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[600],
                child: const Text('Revolution, they...'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[100],
                child: const Text("He'd have you all unravel at the"),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[200],
                child: const Text('Heed not the rabble'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[300],
                child: const Text('Sound of screams but the'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[400],
                child: const Text('Who scream'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[500],
                child: const Text('Revolution is coming...'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[600],
                child: const Text('Revolution, they...'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[100],
                child: const Text("He'd have you all unravel at the"),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[200],
                child: const Text('Heed not the rabble'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[300],
                child: const Text('Sound of screams but the'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[400],
                child: const Text('Who scream'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[500],
                child: const Text('Revolution is coming...'),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.green[600],
                child: const Text('Revolution, they...'),
              ),
            ],
          ),
        ),
      ],
    );
  }
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
