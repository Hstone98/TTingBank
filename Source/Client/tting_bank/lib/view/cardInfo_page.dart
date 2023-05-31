import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tting_bank/conttoller/cardInfo_page_controller.dart' as ctrCardInfo;

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
                        setState(() {
                          // print(value);
                          _cardNumber = value;
                          print(_cardNumber);
                        });
                      }),
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
                            onPressed: () async {
                              //TODO: 등록 버튼이 눌렸을 때 실행할 코드
                              if (!ctrCardInfo.checkCardNumLength(_cardNumber.length)) {
                                showToast("카드 16자리를 입력해주세요.");
                              }
                              if (!ctrCardInfo.checkCardPasswordLength(_cardPassword.length)) {
                                showToast("카드 비밀번호 2자리를 입력해주세요.");
                              }

                              if (await ctrCardInfo.sendCardAddData(
                                      '4', _cardNumber, _cardPassword, '0305') ==
                                  true) {
                                print("Success");
                                Navigator.of(context).pop();
                                showToast('등록 성공!!');
                              } else {
                                showToast('등록 실패!!');
                              }
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

  //----------------------------------------------------------------------------------------------//
  //
  //----------------------------------------------------------------------------------------------//
  void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.white,
      fontSize: 15,
      textColor: Colors.black,
      toastLength: Toast.LENGTH_SHORT,
    );
  }
}
