import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:tting_bank/view/main_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey[500]),
          onPressed: (){
             Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context)=>MainPage(),
                      )
                  );
          }

          ),
          title: TextField(
            decoration:
              InputDecoration(fillColor: Colors.grey.withOpacity(0.2), 
              filled: true,
              enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent), 
              borderRadius: BorderRadius.circular(10)))
           ),
      ),
    
    );
  }
}