import 'package:flutter/material.dart';
import 'package:tting_bank/conttoller/registercard_page_controller.dart' as ctrRegisterCard;
import 'package:fluttertoast/fluttertoast.dart';

class RegisterCardPage extends StatefulWidget {
  @override
  _RegisterCardPageState createState() => _RegisterCardPageState();
}

class _RegisterCardPageState extends State<RegisterCardPage> {
  String _selectedCard = "";
  String _selectedCardCode = "";
  String _inputId = "";
  String _inputPassword = "";

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
          '카드사 로그인',
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
                    decoration: InputDecoration(labelText: 'ID'),
                    onChanged: (value) {
                      setState(() {
                        _inputId = value;
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        _inputPassword = value;
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
                      print(_cardCodes);
                      if (await ctrRegisterCard.sendCardLoginData(
                          'KR', 'CD', 'P', _selectedCardCode, '1', _inputId, _inputPassword)) {
                        print("Success");
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        showToast('로그인 성공!!');
                      } else {
                        showToast('로그인 실패!!');
                      }
                    },
              child: Text('로그인'),
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
            Text('ID: $_inputId'),
            SizedBox(height: 8),
            Text('Password: $_inputPassword'),
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
