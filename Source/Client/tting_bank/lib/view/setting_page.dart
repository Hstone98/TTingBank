import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({
    Key? key,
  }) : super(key: key);

  @override
  SettingPageState createState() => SettingPageState();
}

class SettingPageState extends State<SettingPage> {
  List<String> mainList = [
    '내 정보 수정하기',
    '내 자산',
    '탈퇴하기',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('설정'),
        ),
        body: ListView.separated(
          itemCount: mainList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {},
              title: Container(
                alignment: Alignment.centerLeft,
                height: 40,
                child: Text(
                  mainList[index],
                  textAlign: TextAlign.start,
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(thickness: 2);
          },
        ));
  }
}
