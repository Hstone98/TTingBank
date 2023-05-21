import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter/cupertino.dart';

class CashbackThisMonthTting extends StatefulWidget {
  const CashbackThisMonthTting({Key? key}) : super(key: key);

  @override
  _CashbackThisMonthTtingState createState() => _CashbackThisMonthTtingState();
}

class _CashbackThisMonthTtingState extends State<CashbackThisMonthTting> {
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  List<int> years =
      List.generate(DateTime.now().year - 2019, (index) => 2020 + index);
  List<int> months = List.generate(12, (index) => index + 1);

  void decreaseMonth() {
    setState(() {
      if (month > 1) {
        month--;
      } else {
        month = 12;
        year--;
      }
    });
  }

  void increaseMonth() {
    setState(() {
      if (month < 12) {
        month++;
      } else {
        month = 1;
        year++;
      }
    });
  }

  Future<void> showMonthPicker(BuildContext context) async {
    await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // 모서리를 둥글게 조정
          ),
          title: Text('년도 선택'),
          content: Container(
            height: MediaQuery.of(context).size.height / 2, // 화면 높이의 절반
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true, // 리스트뷰 크기를 내용에 맞게 조정
              physics: BouncingScrollPhysics(), // 스크롤 효과 적용
              itemCount: years.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(years[index].toString()),
                  onTap: () {
                    setState(() {
                      year = years[index];
                      Navigator.of(context).pop();
                    });
                  },
                );
              },
            ),
          ),
        );
      },
    );

    await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // 모서리를 둥글게 조정
          ),
          title: Text('월 선택'),
          content: Container(
            height: MediaQuery.of(context).size.height / 2, // 화면 높이의 절반
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true, // 리스트뷰 크기를 내용에 맞게 조정
              physics: BouncingScrollPhysics(), // 스크롤 효과 적용
              itemCount: months.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(months[index].toString()),
                  onTap: () {
                    setState(() {
                      month = months[index];
                      Navigator.of(context).pop();
                    });
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool canDecrease = year > 2020 || month > 1;
    bool canIncrease =
        year < DateTime.now().year || month < DateTime.now().month;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, // 아이콘 색상 변경
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          '소비 내역',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_left,
                    color: canDecrease
                        ? Colors.black
                        : Colors.grey, // 비활성화일 때 회색으로 변경
                  ),
                  onPressed: canDecrease ? decreaseMonth : null,
                ),
                GestureDetector(
                  onTap: () => showMonthPicker(context),
                  child: Text(
                    '$year년 $month월',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_right,
                    color: canIncrease
                        ? Colors.black
                        : Colors.grey, // 비활성화일 때 회색으로 변경
                  ),
                  onPressed: canIncrease ? increaseMonth : null,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 20, // 예시로 20개의 소비 기록을 표시
              separatorBuilder: (context, index) => Divider(), // 구분선 추가
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('소비 기록 $index'),
                  subtitle: Text('소비 내용'),
                  trailing: Text(
                    '-\1000원',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ), // 소비 금액
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
