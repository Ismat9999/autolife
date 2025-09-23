import 'package:autolife/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../domain/model/post_model.dart';
import '../widgets/views/view_of_details_page.dart';

class DetailsPage extends StatefulWidget {
  final Post? photo;

  const DetailsPage({super.key, this.photo});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late YandexMapController mapController;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          // widget.photo!.caption != null ? widget.photo!.caption! : "No name",
          // style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          "Avto Witson",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      body:Container(
        width: double.infinity,
        child: Stack(
          children: [
            Column(children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 5),
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage("assets/images/ic_person.png"),
                      fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  color: AppColors.mainColor,
                  child: ListView(
                    children: [
                      viewOfDetailsPage(context),
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
    }
  }

