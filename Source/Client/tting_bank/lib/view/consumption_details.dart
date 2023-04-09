import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ConsumptionDetailsScreen extends StatelessWidget {
  const ConsumptionDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.black,//색변경
          ),
        backgroundColor: Colors.white,
        leading: Icon(Icons.arrow_back),
        title: Text('소비 내역',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
    itemCount: 10,
    itemBuilder: (BuildContext ctx, int idx) {
      
        return CosumptionInfo(price: 1000, storeinfo: "빽다방", cashback: 100,);
    }
)
    

      );
  }
}


class CosumptionInfo extends StatelessWidget{
  final int price;
  final String storeinfo;
  final int cashback;
  

    const CosumptionInfo ({
    required this.price,
     required this.cashback, 
     required this.storeinfo, 
     Key? key}) : super (key:key);

      Widget build(BuildContext context){
        
        return SingleChildScrollView(
           scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 5),
            child: Container(
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
                ),
              height: 70,
                child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
          
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(21, 0, 0, 0),
                child: Icon(Icons.attach_money, size: 55),
              ),
                Column(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text('-${price}원', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [Text('${storeinfo}',style: TextStyle(fontSize: 12, color: Colors.grey))],
                      )
                    ],
                  
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(128, 0, 0, 0),
                  child: Text('+${cashback}원', style: TextStyle(fontWeight: FontWeight.bold),),
                )
              
            ],
          
                ),
              ),
          ),
        );
      }
}

