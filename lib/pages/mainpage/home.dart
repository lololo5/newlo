import 'package:flutter/material.dart';

import 'package:newlo/pages/menu/B.dart';
import 'package:newlo/pages/menu/C.dart';
import 'package:newlo/pages/menu/D.dart';
import 'package:newlo/pages/menu/A.dart';
import 'package:newlo/pages/menu/E.dart';
import 'package:newlo/pages/menu/F.dart';
import 'package:newlo/pages/menu/G.dart';
import 'package:newlo/pages/menu/h.dart';
import 'package:newlo/pages/menu/i.dart';
import 'package:newlo/pages/menu/j.dart';
import 'package:newlo/pages/menu/k.dart';
import 'package:newlo/pages/menu/l.dart';
import 'package:newlo/pages/menu/m.dart';
import 'package:newlo/pages/menu/n.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Color.fromARGB(255, 4, 5, 4),
        ),
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.black)),
      ),
    );
  }
}

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<MenuItem> allItems = [
    MenuItem("ข้าวมันไก่", "assets/images/ข้าวไก่.png"),
    MenuItem("ข้าวขาหมู", "assets/images/ขาหมู.png"),
    MenuItem("ผัดไทย", "assets/images/ผัดไทย.png"),
    MenuItem("ส้มตำ", "assets/images/ส้มตำ.png"),
    MenuItem("ข้าวไข่เจียว", "assets/images/ข้าวไข่เจียว.png"),
    MenuItem("ข้าวผัด", "assets/images/ข้าวผัด.png"),
    MenuItem("ก๋วยเตี๋ยว", "assets/images/ก๋วยเตี๋ยว.png"),
    MenuItem("ไก่ทอด", "assets/images/ไก่ทอด.png"),
    MenuItem("เเกงเขียวหวาน", "assets/images/เขียวหวาน.png"),
    MenuItem("คะน้า", "assets/images/คะน้า.png"),
    MenuItem("ลาบหมู", "assets/images/ลาบหมู.png"),
    MenuItem("โจ๊ก", "assets/images/โจ๊ก.png"),
    MenuItem("หมูปิ้ง", "assets/images/หมูปิ้ง.png"),
    MenuItem("ต้มยำกุ้ง", "assets/images/ต้มยำกุ้ง.png"),
  ];

  List<MenuItem> filteredItems = [];
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    filteredItems = allItems;
  }

  void _filterMenu(String query) {
    final results = allItems.where((item) {
      return item.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      searchQuery = query;
      filteredItems = results;
    });
  }

  void _onMenuTap(BuildContext context, String title) {
    if (title == "ข้าวมันไก่") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => A()));
    } else if (title == "ข้าวขาหมู") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => B()));
    } else if (title == "ผัดไทย") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => C()));
    } else if (title == "ส้มตำ") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => D()));
    } else if (title == "ข้าวไข่เจียว") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => E()));
    } else if (title == "ข้าวผัด") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => F()));
    } else if (title == "ก๋วยเตี๋ยว") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => G()));
    } else if (title == "ไก่ทอด") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => h()));
    } else if (title == "เเกงเขียวหวาน") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => i()));
    } else if (title == "คะน้า") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => j()));
    } else if (title == "ลาบหมู") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => k()));
    } else if (title == "โจ๊ก") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => l()));
    } else if (title == "หมูปิ้ง") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => m()));
    } else if (title == "ต้มยำกุ้ง") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => n()));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("คุณเลือก: $title")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("เมนูอาหาร")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "ค้นหาเมนู...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: _filterMenu,
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: filteredItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  return GestureDetector(
                    onTap: () => _onMenuTap(context, item.title),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 4),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(item.imagePath, width: 100, height: 100),
                          SizedBox(height: 10),
                          Text(item.title, style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  final String title;
  final String imagePath;

  MenuItem(this.title, this.imagePath);
}
