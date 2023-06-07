import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tting_bank/conttoller/cardInfo_page_controller.dart'
    as ctrCardInfo;
import 'package:tting_bank/view/main_page.dart';

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
  String _selectedCard = "";
  String _selectedCardCode = "";
  String _cardNumber = "";
  String _cardPassword = "";

  final List<String> _cards = [
    '현대카드',
    '삼성카드',
    '롯데카드',
    '비씨카드',
    '신한카드',
    '국민카드',
    '우리카드',
    '하나카드',
    '농협',
    'ibk',
  ];

  final List<String> _cardCodes = [
    '0302',
    '0303',
    '0311',
    '0305',
    '0306',
    '0301',
    '0309',
    '0313',
    '0304',
    '0000'
  ];
//------------------------------------------------------------------------------------------------//
//
//------------------------------------------------------------------------------------------------//
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
        title: Text(
          '카드 등록',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                children: _cards.map((card) => _buildCardButton(card)).toList(),
              ),
            ),
            SizedBox(height: 16),
            Text(
              '$_selectedCard',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Visibility(
              visible: _selectedCard.isNotEmpty,
              child: Column(
                children: [
                  TextFormField(
                    maxLength: 16,
                    decoration: InputDecoration(
                        labelText: '카드번호', hintText: '카드 번호 (- 제외)'),
                    onChanged: (value) {
                      setState(() {
                        _cardNumber = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    maxLength: 2,
                    decoration: InputDecoration(
                        labelText: '카드 비밀번호 앞 두 자리',
                        hintText: '카드 비밀번호 앞 두 자리(**)'),
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        _cardPassword = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black54,
              ),
              onPressed: _selectedCard.isEmpty
                  ? null
                  : () async {
                      //TODO: 등록 버튼이 눌렸을 때 실행할 코드
                      if (!ctrCardInfo.checkCardNumLength(_cardNumber.length)) {
                        showToast("카드 16자리를 입력해주세요.");
                      }
                      if (!ctrCardInfo
                          .checkCardPasswordLength(_cardPassword.length)) {
                        showToast("카드 비밀번호 2자리를 입력해주세요.");
                      } else {
                        if (await ctrCardInfo.sendCardAddData(
                                user.id,
                                _cardNumber,
                                _cardPassword,
                                _selectedCardCode) ==
                            true) {
                          print("Success");
                          Future.delayed(Duration(milliseconds: 1500))
                              .then((_) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage()),
                            );
                            Refresh.addCardInfoChangedEvent(true);
                          });
                          showToast('등록 성공!!');
                        } else {
                          showToast('등록 실패!!');
                        }
                      }
                    },
              child: Text('등록'),
            ),
          ],
        ),
      ),
    );
  }

//------------------------------------------------------------------------------------------------//
//
//------------------------------------------------------------------------------------------------//
  Widget _buildCardButton(String card) {
    return InkWell(
      onTap: () {
        setState(
          () {
            for (int i = 0; i < _cardCodes.length; i++) {
              if (_cards[i] == card) {
                _selectedCardCode = _cardCodes[i];
              }
            }
            _selectedCard = card;
          },
        );
      },
      child: Card(
        child: Center(
          child: Text(card),
        ),
      ),
    );
  }

//------------------------------------------------------------------------------------------------//
//
//------------------------------------------------------------------------------------------------//
  void _registerCard() {
    if (_selectedCard.isEmpty) {
      return;
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Card Registration'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Card: $_selectedCard'),
            SizedBox(height: 8),
            Text('ID: $_cardNumber'),
            SizedBox(height: 8),
            Text('Password: $_cardPassword'),
          ],
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black54,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
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
