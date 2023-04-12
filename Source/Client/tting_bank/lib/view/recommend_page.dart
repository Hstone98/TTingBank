import 'package:flutter/material.dart';
import 'package:tting_bank/data/img_card.dart';

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
                    subtitle: Text('NH 올바른 FLEX'),
                  ),
                  Image.asset(
                    ImgCard.listCard[0],
                  ),
                  ListTile(
                    title: Text(
                      'Cashback Recommended',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Samsung taptap DIGITAL'),
                  ),
                  Image.asset(
                    ImgCard.listCard[1],
                  ),
                  ListTile(
                    title: Text(
                      'AI Recommended',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Shinhan B.Big'),
                  ),
                  Image.asset(
                    ImgCard.listCard[2],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
