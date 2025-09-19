import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../../domain/model/member_model.dart';
import '../../blocs/search_bloc/search_bloc.dart';
import '../items/item_of_member.dart';

Widget viewOfSearchPage(BuildContext context, SearchBloc searchBloc, bool isLoading, List<Member> items ){
  return Scaffold(
    backgroundColor: Colors.black,
    body: Stack(
        children:[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 45,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(35, 45, 75, 1),
                      borderRadius: BorderRadius.circular(7)),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: searchBloc.searchController,
                    decoration: InputDecoration(
                      hintText: "Qidiruv",
                      border: InputBorder.none,
                      hintStyle:
                      TextStyle(fontSize: 15, color: Colors.grey),
                      icon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context,index){
                      return itemOfMember(searchBloc.items[index],searchBloc,context);
                    },
                  ),
                ),
              ],
            ),
          ),
          searchBloc.isLoading ? Center(child: CircularProgressIndicator(),):SizedBox.shrink(),
        ]
    ),
  );
}