import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CashbackThisMonthTting extends StatelessWidget {
  const CashbackThisMonthTting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black,//색변경
          ),
        backgroundColor: Colors.white,
        leading: Icon(Icons.menu),
        title: Text('소비 내역',style: TextStyle(color: Colors.black)),
      ),
      body: Column( 
        children: [ 
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25,50,0,20),
                child: Text('이번달 소비액',style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          
          Padding(
            padding: const EdgeInsets.fromLTRB(200,10,20,0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: '--금액 출력란--',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Colors.white)
                )
          
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18,50,0,0),
                child: Text('이번달 소비금액',style: TextStyle(color: Colors.black, fontSize: 15)),
              ),
              
            ]
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18,0,0,20),
                  child: Text('1,120,000',style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),
                )
              ],
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,20),
            child: LinearPercentIndicator(
              animation: true,
              animationDuration: 1000,
              lineHeight: 20,
              percent: 0.6,
              progressColor: Colors.red,
              backgroundColor: Colors.grey.shade200,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18,50,0,0),
                child: Text('이번달 받은 캐시백',style: TextStyle(color: Colors.black, fontSize: 15)),
              ),
              
            ]
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18,0,0,20),
                  child: Text('120,000',style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),
                )
              ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,20),
            child: LinearPercentIndicator(
              animation: true,
              animationDuration: 1000,
              lineHeight: 20,
              percent: 0.3,
              progressColor: Colors.purple,
              backgroundColor: Colors.grey.shade200,
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18,50,0,0),
                child: Text('이번달 받은 카드혜택',style: TextStyle(color: Colors.black, fontSize: 15)),
              ),
              
            ]
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18,0,0,20),
                  child: Text('220,000',style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),
                )
              ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,20),
            child: LinearPercentIndicator(
              animation: true,
              animationDuration: 1000,
              lineHeight: 20,
              percent: 0.2,
              progressColor: Colors.green,
              backgroundColor: Colors.grey.shade200,
            ),
          ),





          

          
      ]
      
      ),


    );
  }
}