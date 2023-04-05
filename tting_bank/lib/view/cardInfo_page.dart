import 'package:flutter/material.dart';

//카드등록 페이지
class CardInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1E1E),
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
        backgroundColor: Color.fromARGB(255, 82, 81, 81),
        title: Text(
          "카드 등록",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        //오버플로우 나는거 해결
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Card Information",
              style: TextStyle(
                fontSize: 23,
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              height: 30,
              thickness: 2,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "카드 번호",
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 185, 183, 183),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "만료일 (MM/YY)",
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 185, 183, 183),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "생년월일 (YY/MM/DD)",
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 185, 183, 183),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "비밀번호",
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 185, 183, 183),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "CVV",
                hintStyle: TextStyle(
                  color: Color.fromARGB(255, 185, 183, 183),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 360,
                  height: 50,
                  margin: EdgeInsets.only(
                    top: 140.0,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // 버튼이 눌렸을 때 실행할 코드
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 68, 75, 88),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9)),
                    ),
                    child: Text('등록'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
