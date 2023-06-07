import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:tting_bank/conttoller/paymentlist_controller.dart';
import 'package:tting_bank/conttoller/profile_controller.dart';
import 'package:tting_bank/conttoller/userid_controller.dart';
import 'package:tting_bank/model/consumption.dart';
import 'package:tting_bank/model/user.dart';

class ConsumptionThisMonth extends StatefulWidget {
  const ConsumptionThisMonth({Key? key}) : super(key: key);

  @override
  _ConsumptionThisMonthState createState() => _ConsumptionThisMonthState();
}

class _ConsumptionThisMonthState extends State<ConsumptionThisMonth> {
  User user = User(id: 0, name: '', email: '', connected_id: ''); //사용자 정보
  List<Consumption> consumptionList = []; //결제내역 정보
  int year = DateTime.now().year;
  int month = DateTime.now().month;
  String monthString = ''; //쿼리 보낼 때 String 으로 주기 위해서 변환
  String yearString = ''; //쿼리 보낼 때 String 으로 주기 위해서 변환
  List<int> years =
      List.generate(DateTime.now().year - 2019, (index) => 2020 + index);
  List<int> months = List.generate(12, (index) => index + 1);

  @override
  void initState() {
    super.initState();
    initUser();
  }

  void decreaseMonth() {
    setState(() {
      if (month > 1) {
        month--;
        monthString = month.toString();

        if (month < 10) {
          //month int로 받으면 앞에 0이 없어져서 0을 붙임
          monthString = month.toString().padLeft(2, '0');
        }
      } else {
        month = 12;
        year--;
        monthString = month.toString().padLeft(2, '0');
        yearString = year.toString();
      }
    });
  }

  void increaseMonth() {
    setState(() {
      if (month < 12) {
        month++;
        monthString = month.toString();

        if (month < 10) {
          //month int로 받으면 앞에 0이 없어져서 0을 붙임
          monthString = month.toString().padLeft(2, '0');
        }
      } else {
        month = 1;
        year++;
        monthString = month.toString().padLeft(2, '0');
        yearString = year.toString();
      }
    });
  }

//받은 비동기 User를 User형태로 name에 저장하고 상태를 저장
  Future<void> initUser() async {
    User name = await userSet(await KakaoName());
    setState(() {
      user = name;
    });
    print(year.toString() + ' ' + month.toString());
    if (month < 10) {
      //month int로 받으면 앞에 0이 없어져서 0을 붙임
      monthString = month.toString().padLeft(2, '0');
    }
    yearString = DateTime.now().year.toString();
  }

//받은 user에 대한 데이터를 가져오고 거래내역 조회
  Future<void> initConsumption() async {
    List<Consumption> list =
        await consumptionListSet(user.id, yearString, monthString); //거래내역 조회 실행
    setState(() {
      consumptionList = list;
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
                      yearString = year.toString(); //String 으로 yeara 저장
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
                      if (month < 10) {
                        //month int로 받으면 앞에 0이 없어져서 0을 붙임
                        monthString = month.toString().padLeft(2, '0');
                        //String 으로 month 저장
                      }
                      Navigator.of(context).pop();
                      initConsumption();
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
          '${user.name}님 소비 내역',
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
                  onPressed: canDecrease
                      ? () {
                          decreaseMonth();
                          initConsumption();
                        }
                      : null,
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
                  onPressed: canIncrease
                      ? () {
                          increaseMonth();
                          initConsumption();
                        }
                      : null,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: consumptionList.length, // 예시로 20개의 소비 기록을 표시
              separatorBuilder: (context, index) => Divider(), // 구분선 추가
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('소비 기록 $index'),
                  subtitle: Text(consumptionList[index].name),
                  trailing: Text(
                    consumptionList[index].amount.toString() + '원',
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
