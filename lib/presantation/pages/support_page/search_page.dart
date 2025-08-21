import 'package:autolife/core/theme/app_colors.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(35, 45, 75, 1),
      body: Stack(
        children:[
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white24,
                  border: Border.all(width: 1,color: Colors.black54),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border:InputBorder.none,
                            icon: Icon(EvaIcons.search,size: 32,color: Colors.blueGrey.shade800,),
                            hintText: 'Qidiruv',
                            hintStyle: TextStyle(color: Colors.white24),
                            suffixIcon: Icon(
                              EvaIcons.close,
                              color: Colors.blueGrey.shade800,
                            ),
                          ),
                          cursorColor: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
                    ),
          ),
    ]
      ),
    );
  }
}
