import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tting_bank/conttoller/profile_controller.dart';
import 'package:tting_bank/conttoller/recommend_controller.dart';
import 'package:tting_bank/conttoller/nocardrecommend_controller.dart';
import 'package:tting_bank/conttoller/userid_controller.dart';
import 'package:tting_bank/data/img_card.dart';
import 'package:tting_bank/data/recommend_card.dart';
import 'package:tting_bank/data/nocardrecommend.dart';
import 'package:tting_bank/model/user.dart';

//------------------------------------------------------------------------------------------------//
// 카드 추천 페이지
//------------------------------------------------------------------------------------------------//

class RecommendPage extends StatefulWidget {
  final String inputName;
  final User user;

  RecommendPage(this.inputName, this.user, {Key? key}) : super(key: key);

  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late String selectedTabLabel;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        selectedTabLabel = TABS[_tabController.index].label;
      });
    });
    selectedTabLabel = TABS[0].label;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          widget.inputName,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: TABS.map((e) => Tab(
            child: Text(
              e.label,
              style: TextStyle(color: Colors.black),
            ),
          )).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          CreateCardInfoPage(
            selectedTabLabel: selectedTabLabel,
            inputName: widget.inputName,
            user: widget.user,
          ),
          CreateCardInfoPage(
            selectedTabLabel: selectedTabLabel,
            inputName: widget.inputName,
            user: widget.user,
          ),
          CreateCardInfoPage(
            selectedTabLabel: selectedTabLabel,
            inputName: widget.inputName,
            user: widget.user,
          ),
          CreateCardInfoPage(
            selectedTabLabel: selectedTabLabel,
            inputName: widget.inputName,
            user: widget.user,
          ),
        ],
      ),
    );
  }
}

class CreateCardInfoPage extends StatefulWidget {
  final String selectedTabLabel;
  final String inputName;
  final User user;

  const CreateCardInfoPage({
    required this.selectedTabLabel, required this.inputName, required this.user,
    Key? key,
  }) : super(key: key);

  @override
  _CreateCardInfoPageState createState() => _CreateCardInfoPageState();
}

class _CreateCardInfoPageState extends State<CreateCardInfoPage> { // 사용자 정보
  List<Recommend_card>? cardList = [];
  List<NoCardRecommend>? nohavecardList = [];

  @override
  void initState() {
    super.initState();
    print(widget.user.email);
  }

  @override
  void didUpdateWidget(CreateCardInfoPage oldWidget) {
    if (oldWidget.selectedTabLabel != widget.selectedTabLabel) {
      recommendListSet(widget.user.email, widget.inputName, widget.selectedTabLabel);
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> recommendListSet(String cdname, String company, String label) async {
    List<Recommend_card> list = await recommend(cdname, company, label);
    List<NoCardRecommend> nohaveList = await nocardrecommend(widget.inputName, widget.selectedTabLabel);

// cdname을 기준으로 nohaveList를 그룹화합니다.
    Map<String, List<NoCardRecommend>> groupedMap = {};
    nohaveList.forEach((card) {
      groupedMap[card.cdname] ??= [];
      groupedMap[card.cdname]!.add(card);
    });

// list에 있는 cdname을 제외한 그룹을 선택합니다.
    List<NoCardRecommend> filteredList = [];
    groupedMap.forEach((cdname, cards) {
      if (!list.any((ownedCard) => ownedCard.cdname == cdname)) {
        filteredList.addAll(cards);
      }
    });

    setState(() {
      cardList = list;
      nohaveList = filteredList;
      nohavecardList = nohaveList;
    });
  }

  int getCardListLength() {
    return cardList!.length;
  }

  int getnohaveCardListLength() {
    return nohavecardList!.length;
  }

  @override
  Widget build(BuildContext context) {
    int cardListLength = getCardListLength();
    int nocardListLength = getnohaveCardListLength();
    return SingleChildScrollView(
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
                    '보유중인 카드',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                for (int i = 0; i < cardListLength; i++)
                  Card(
                    child: CreateCardInfo(
                      selectedTabLabel: widget.selectedTabLabel,
                      cardList: cardList ?? [],
                      index: i,),
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
                    '미 보유 카드 추천',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                // TODO : 미보유 카드 추천 동적 할당 코드.
                for (int i = 0; i < nocardListLength; i++)
                  Card(
                    child: CreateNoCardInfo(
                      selectedTabLabel: widget.selectedTabLabel,
                      nohavecardList: nohavecardList ?? [],
                      index: i,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CreateCardInfo extends StatefulWidget {
  final String selectedTabLabel;
  List<Recommend_card> cardList = [];
  final int index;

  CreateCardInfo({required this.selectedTabLabel, required this.cardList, required this.index, Key? key}) : super(key: key);

  @override
  _CreateCardInfoState createState() => _CreateCardInfoState();
}

class _CreateCardInfoState extends State<CreateCardInfo> {
  bool isCardClicked = false; // 카드 클릭 여부를 나타내는 변수
  @override
  void initState() {
    super.initState();
  }

  String findBenefit(String label) {
    if (label == '할인금액') {
      int discount = widget.cardList[widget.index].discount ?? 0;
      if (discount >= 100)
        return widget.cardList[widget.index].discount.toString() + ' 원 할인';
      else
        return 'error';
    }
    else if (label == '할인률') {
      int discount = widget.cardList[widget.index].discount ?? 0;
      if (0< discount && discount < 100)
        return widget.cardList[widget.index].discount.toString() + ' % 할인';
      else
        return 'error';
    }
    else if (label == '적립') {
      int accumulate = widget.cardList[widget.index].accumulate ?? 0;
      if (accumulate >= 100)
        return widget.cardList[widget.index].accumulate.toString() + ' 원 적립';
      else
        return widget.cardList[widget.index].accumulate.toString() + ' % 적립';
    } else {
      int cashback = widget.cardList[widget.index].cashback ?? 0;
      if (cashback >= 100)
        return widget.cardList[widget.index].cashback.toString() + ' 원 캐시백';
      else
        return widget.cardList[widget.index].cashback.toString() + ' % 캐시백';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          // GestureDetector를 사용하여 카드 클릭 이벤트 처리
          onTap: () {
            setState(() {
              isCardClicked = !isCardClicked; // 카드 클릭 상태 변경
            });
          },
          child: Row(
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
                      SizedBox(height: 25),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          '${widget.cardList[widget.index].cdname}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          findBenefit(widget.selectedTabLabel),
                        ),
                      ),
                      SizedBox(height: 25),
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
                  cardPath(widget.cardList[widget.index].cdname),
                  width: 120,
                  height: 60,
                ),
              ),
            ],
          ),
        ),
        if (isCardClicked) // 카드가 클릭된 경우에만 작은 페이지 표시
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '${widget.cardList[widget.index].text}',
              style: TextStyle(fontSize: 16),
            ),
          ),
      ],
    );
  }
}

class CreateNoCardInfo extends StatefulWidget {
  final String selectedTabLabel;
  List<NoCardRecommend> nohavecardList = [];
  final int index;

  CreateNoCardInfo({required this.selectedTabLabel, required this.nohavecardList, required this.index, Key? key}) : super(key: key);

  @override
  _CreateNoCardInfoState createState() => _CreateNoCardInfoState();
}

class _CreateNoCardInfoState extends State<CreateNoCardInfo> {
  bool isCardClicked = false;
  @override
  void initState() {
    super.initState();
  }

  String findBenefit(String label) {
    if (label == '할인금액') {
      int discount = widget.nohavecardList[widget.index].discount ?? 0;
      if (discount >= 100)
        return widget.nohavecardList[widget.index].discount.toString() + ' 원 할인';
      else
        return 'error';
    }
    else if (label == '할인률') {
      int discount = widget.nohavecardList[widget.index].discount ?? 0;
      if (0< discount && discount < 100)
        return widget.nohavecardList[widget.index].discount.toString() + ' % 할인';
      else
        return 'error';
    }
    else if (label == '적립') {
      int accumulate = widget.nohavecardList[widget.index].accumulate ?? 0;
      if (accumulate >= 100)
        return widget.nohavecardList[widget.index].accumulate.toString() + ' 원 적립';
      else
        return widget.nohavecardList[widget.index].accumulate.toString() + ' % 적립';
    } else {
      int cashback = widget.nohavecardList[widget.index].cashback ?? 0;
      if (cashback >= 100)
        return widget.nohavecardList[widget.index].cashback.toString() + ' 원 캐시백';
      else
        return widget.nohavecardList[widget.index].cashback.toString() + ' % 캐시백';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isCardClicked = !isCardClicked;
            });
          },
          child: Row(
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
                      SizedBox(height: 25),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          '${widget.nohavecardList[widget.index].cdname}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          findBenefit(widget.selectedTabLabel),
                        ),
                      ),
                      SizedBox(height: 25),
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
                  cardPath(widget.nohavecardList[widget.index].cdname),
                  width: 120,
                  height: 60,
                ),
              ),
            ],
          ),
        ),
        if (isCardClicked)
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '${widget.nohavecardList[widget.index].text}',
              style: TextStyle(fontSize: 16),
            ),
          ),
      ],
    );
  }
}
//받아온 카드이름을 경로로 변환
String cardPath(String cdname) {
  return 'bankTting/img/' + cdname.toString() + '.png';
}

class TabInfo {
  final String label;
  const TabInfo({required this.label});
}

const TABS = [
  TabInfo(label: '할인금액'),
  TabInfo(label: '할인률'),
  TabInfo(label: '적립'),
  TabInfo(label: '캐시백'),
];