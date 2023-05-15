import 'package:flutter/material.dart';
import 'package:tting_bank/data/img_card.dart';

//카드추천 페이지
class RecommendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
    length: 4,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 236, 243, 244),
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
          backgroundColor: Color.fromARGB(255, 236, 243, 244),
          title: Text(
            "twosome place",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: TABS.map(
              (e) => Tab(
                child: Text(
                  e.label,style: TextStyle(color: Colors.black),
                ),
              )
            ).toList()
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SingleChildScrollView(
                
                child: Column(
                   mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 20, 0, 0),
                child: Text(
                  '보유중인 카드', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[500],),
                )
              ),
                    Card(
                      child: Createcardinfo(
                      ),
                    ),
                    Card(
                      child: Createcardinfo(
                      ),
                    ),
                    Card(
                      child: Createcardinfo(
                      ),
                    ),
                  ],
                ),
              ),
        
              SingleChildScrollView(
                child: Column(
                   mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 20, 0, 0),
                child: Text(
                  '미 보유 카드 추천', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[500],),
                )
              ),
                    Card(
                      child: Createcardinfo(
                      ),
                    ),
                    Card(
                      child: Createcardinfo(
                      ),
                    ),
                    Card(
                      child: Createcardinfo(
                      ),
                    ),
                  ],
                ),
              ),
        
        
        
              
            ],
          ),
        ),
      ),
    );
  }
}

class Createcardinfo extends StatelessWidget{
Widget build(BuildContext context){
  return Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8, 4, 0, 4),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: Text(
                      'NH 올바른 FLEX',style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      'NH 올바른 FLEX',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      'twosome place 10%할인',
                     
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                    child: Text(
                      'NH 올바른 FLEX',style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),)
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(20),
              topLeft: Radius.circular(0),
              topRight: Radius.circular(20),
            ),
            child: Image.asset(
                    ImgCard.listCard[0],
                    width: 120,
                    height: 60,
                  ),
          ),
        ],
      );
}
}


class TabInfo{
  final String label; 

  const TabInfo({
    required this.label
  });

}
const TABS= [
  TabInfo(label: '할인금액 순'),
  TabInfo(label: '할인률 순'),
  TabInfo(label: '적립금 순'),
  TabInfo(label: '캐시백 순'),
];