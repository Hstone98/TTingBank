import 'package:flutter/material.dart';

//카드추천 페이지
class RecommendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        backgroundColor: Colors.white,
        title: Text(
          "twosome place",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      'Partnership Recommended',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('kb 나라사랑카드'),
                  ),
                  // Image.asset(
                  //이미지 넣을 코드
                  // ),
                  ListTile(
                    title: Text(
                      'Cashback Recommended',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('ibk 나라사랑카드'),
                  ),
                  // Image.asset(
                  //이미지 넣을 코드
                  // ),
                  ListTile(
                    title: Text(
                      'AI Recommended',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('카카오 체크카드'),
                  ),
                  // Image.asset(
                  //이미지 넣을 코드
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
