import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learen_3/features/add/view/add.dart';
import 'package:learen_3/features/auth/presentation/blocauth/bloc/auth_bloc.dart';
import 'package:learen_3/features/auth/presentation/blocauth/bloc/auth_event.dart';
import 'package:learen_3/features/khatma/view/khatma.dart';
import 'package:learen_3/features/more/view/more.dart';
import 'package:learen_3/features/notifications/view/notifications.dart';
import 'package:learen_3/features/quran/view/quran.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Khatma(),
    Quran(),
    Notifications(),
    More(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _screens[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // // يمكن وضع أي عملية هنا
          // print("تم الضغط على الزر العائم");
          Navigator.push(context, MaterialPageRoute(builder: ((context) => Add_view())));
        },
        child: Text("إضافة ختمة"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              // Colors: _currentIndex == 0 ? Colors.blue : Colors.grey,
              onTap: () => _onTabTapped(0), 
              child:Column(mainAxisSize: MainAxisSize.min,children: [
                  Icon(Icons.amp_stories_rounded),Text("ختماتي")
                ],),
              ),
            
            GestureDetector(
               // color: _currentIndex == 1 ? Colors.blue : Colors.grey,
              onTap: () => _onTabTapped(1),
              child: Column(mainAxisSize: MainAxisSize.min,children: [
                  Icon(Icons.menu_book_rounded),Text("قراني")
                ],),
            ),
            SizedBox(width: 40), // مكان الزر العائم
            GestureDetector(
              // color: _currentIndex == 2 ? Colors.blue : Colors.grey,
              onTap: () => _onTabTapped(2),
              child: Column(mainAxisSize: MainAxisSize.min,children: [
                  Icon(Icons.notification_important_rounded),Text("اشعاراتي")
                ],),
            ),
            GestureDetector(
              // color: _currentIndex == 3 ? Colors.blue : Colors.grey,
              onTap: () => _onTabTapped(3),
              child: Column(mainAxisSize: MainAxisSize.min,children: [
                  Icon(Icons.grid_view_rounded),Text("المزيد"),
                  ],),
            ),
          ],
        ),
      ),
    );
  }
}

// الواجهات الأربع









