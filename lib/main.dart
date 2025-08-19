import 'package:flutter/material.dart';
import 'package:global_bottom_navigation_bar/global_bottom_navigation_bar.dart';
import 'package:newlo/pages/mainpage/Tool.dart';
import 'package:newlo/pages/mainpage/home.dart';
import 'package:newlo/pages/mainpage/lo.dart';
import 'package:newlo/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeProject.themeLight(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ScaffoldGlobalBottomNavigation(
      listOfChild: [Home(), Tool(), Lo(), ],
      listOfBottomNavigationItem: [
        BottomNavigationItem(
          color: Colors.white,
          activeIcon: Image.asset(
            'assets/images/as2.png',
            width: 70,
            height: 70,
          ),
          inActiveIcon: Image.asset(
            'assets/images/as2.png',
            width: 60,
            height: 60,
          ),
          title: 'อาหารทั่วไป',
          vSync: this,
        ),
        BottomNavigationItem(
          color: Colors.white,
          activeIcon: Image.asset(
            'assets/images/as.png.png',
            width: 85,
            height: 85,
          ),
          inActiveIcon: Image.asset(
            'assets/images/as.png.png',
            width: 75,
            height: 75,
          ),
          title: 'พลังงานที่ควรได้รับ',
          vSync: this,
        ),
        BottomNavigationItem(
          color: Colors.white,
          activeIcon: Image.asset(
            'assets/images/as3.png',
            width: 85,
            height: 85,
          ),
          inActiveIcon: Image.asset(
            'assets/images/as3.png',
            width: 75,
            height: 75,
          ),
          title: 'คำนวณอาหาร',
          vSync: this,
        ),
      ],
    );
  }
}
