import 'package:flutter/material.dart';

class RegisterCardPage extends StatefulWidget {
  @override
  _RegisterCardPageState createState() => _RegisterCardPageState();
}

class _RegisterCardPageState extends State<RegisterCardPage> {
  String _selectedCard = "";
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
    'ibk',
    '농협'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Card Registration',
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
              onPressed: _selectedCard.isEmpty ? null : _registerCard,
              child: Text('Register Card'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardButton(String card) {
    return InkWell(
      onTap: () {
        setState(
          () {
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
}
