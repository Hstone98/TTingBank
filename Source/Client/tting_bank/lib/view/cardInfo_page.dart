import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//------------------------------------------------------------------------------------------------//
//
//------------------------------------------------------------------------------------------------//
class CardInfoPage extends StatefulWidget {
  @override
  _CardInfoPageState createState() => _CardInfoPageState();
}

//------------------------------------------------------------------------------------------------//
//
//------------------------------------------------------------------------------------------------//
class _CardInfoPageState extends State<CardInfoPage> {
  String _cardNumber = "";
  String _cardPassword = "";

  TextEditingController val1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text("카드 등록", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 15),
                  TextFormField(
                      maxLength: 16,
                      keyboardType: TextInputType.number,
                      controller: val1,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "카드 번호 (- 제외)",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 185, 183, 183),
                        ),
                        border: OutlineInputBorder(),
                        labelText: '카드번호',
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                      validator: (value) {
                        // if (value != null) {
                        //   for (int i = 0; i < 19; i++) {
                        //     if (i % 4 == 0) {
                        //       value = value?.concat(" ");
                        //     }
                        //   }
                        // }
                      }),

                  SizedBox(height: 16),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     filled: true,
                  //     fillColor: Colors.white,
                  //     hintText: "만료일 (MM/YY)",
                  //     hintStyle: TextStyle(
                  //       color: Color.fromARGB(255, 185, 183, 183),
                  //     ),
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),
                  // SizedBox(height: 16),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     filled: true,
                  //     fillColor: Colors.white,
                  //     hintText: "생년월일 (YY/MM/DD)",
                  //     hintStyle: TextStyle(
                  //       color: Color.fromARGB(255, 185, 183, 183),
                  //     ),
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),
                  SizedBox(height: 16),
                  TextField(
                    maxLength: 2,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "카드 비밀번호 앞 두자리(**)",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 185, 183, 183),
                      ),
                      border: OutlineInputBorder(),
                      labelText: '카드번호 앞 두자리',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _cardPassword = value;
                      });
                    },
                  ),
                  // SizedBox(height: 16),
                  // TextField(
                  //   decoration: InputDecoration(
                  //     filled: true,
                  //     fillColor: Colors.white,
                  //     hintText: "CVV",
                  //     hintStyle: TextStyle(
                  //       color: Color.fromARGB(255, 185, 183, 183),
                  //     ),
                  //     border: OutlineInputBorder(),
                  //   ),
                  // ),
                  // SizedBox(height: 15),
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20), // 여백 추가
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              //TODO: 등록 버튼이 눌렸을 때 실행할 코드
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("등록 완료"),
                                    content: Text("카드가 정상 등록되었습니다."),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop(); // 대화상자 닫기
                                          Navigator.of(context).pop(); // 이전 페이지로 돌아가기
                                        },
                                        child: Text("확인"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 68, 75, 88),
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10),
                            ),
                            child: Text(
                              '등록',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50), // 여백 추가
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
