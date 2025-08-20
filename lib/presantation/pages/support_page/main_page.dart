import 'dart:async';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late ScrollController _scrollController;
  late Timer _timer;
  int _currentIndex = 0;

  final List<Map<String, dynamic>> services = [
    {
      'title': 'Express Servis',
      'subtitle': 'Tezkor ta\'mirlash',
      'icon': Icons.build,
      'color': Color.fromRGBO(229, 62, 62, 1),
      'location': 'Tashkent'
    },
    {
      'title': 'Premium Car Wash',
      'subtitle': 'Avtomobil yuvish',
      'icon': Icons.local_car_wash,
      'color': Color.fromRGBO(49, 130, 206, 1),
      'location': 'Samarkand'
    },
    {
      'title': 'Tire Master',
      'subtitle': 'Shinalar almashtirish',
      'icon': Icons.settings,
      'color': Color.fromRGBO(56, 161, 105, 1),
      'location': 'Bukhara'
    },
    {
      'title': 'Oil Change Pro',
      'subtitle': 'Moy almashtirish',
      'icon': Icons.oil_barrel,
      'color': Color.fromRGBO(214, 158, 46, 1),
      'location': 'Nukus'
    },
  ];

  @override
  void initState() {
    super.initState();
    _scrollController= ScrollController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_scrollController.hasClients) {
        double maxScroll = _scrollController.position.maxScrollExtent;
        double currentScroll = _scrollController.offset;
        double itemWidth = 280.0; // Card width + padding

        if (currentScroll >= maxScroll) {
          // Reset to beginning
          _scrollController.animateTo(
            0,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          setState(() => _currentIndex = 0);
        } else {
          // Scroll to next item
          _scrollController.animateTo(
            currentScroll + itemWidth,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
          setState(() => _currentIndex++);
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors:[
                  Color.fromRGBO(35, 45, 75, 1),
                  Color.fromRGBO(25, 35, 65, 1),
                ]
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader('Avto Servislar', LucideIcons.wrench, Colors.red),
              SizedBox(height: 15),
              Container(
                height: 160,
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: services.length,
                  itemBuilder: (context, index) {
                    return _buildAutoScrollCard(services[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildAutoScrollCard(Map<String, dynamic> service) {
    return Container(
      width: 260,
      margin: EdgeInsets.only(right: 15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            service['color'].withOpacity(0.1),
            service['color'].withOpacity(0.2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: service['color'].withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: service['color'].withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: service['color'].withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  service['icon'],
                  color: service['color'],
                  size: 24,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service['title'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[400],
                      ),
                    ),
                    Text(
                      service['subtitle'],
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Spacer(),

          Row(
            children: [
              Icon(Icons.location_on, size: 14, color: Colors.grey[500]),
              SizedBox(width: 4),
              Text(
                service['location'],
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Mavjud',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: service['color'],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _buildSectionHeader(String title, IconData icon, Color color) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(width: 12),
        Icon(icon, color: color, size: 20),
        SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            'Barchasini ko\'rish →',
            style: TextStyle(
              color: Colors.blue[600],
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

}
