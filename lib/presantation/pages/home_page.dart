import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("AutoLife",style: TextStyle(color: Colors.white,fontSize: 30),),
      ),
      body:Container(
        color: Colors.blueGrey.shade900,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Your go-to digital platform for car owners",style: TextStyle(color: Colors.white,fontSize: 40,),),
              SizedBox(height: 5,),
              Text("All services for your car in one place",style: TextStyle(color: Colors.grey),),
              SizedBox(height: 5,),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueGrey.shade300,
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Icon(Icons.search,size: 30,color: Colors.white,),
                      SizedBox(width: 10,),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.white),
                        ),

                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
