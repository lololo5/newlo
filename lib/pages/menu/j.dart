import 'package:flutter/material.dart';

class j extends StatelessWidget {
  const j({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('เมนู')),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        // เผื่อเนื้อหายาวเกินจอ
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              'assets/images/คะน้า.png', // เปลี่ยน path ให้ตรงกับรูปของคุณ
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'คะน้าหมูกรอบ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            // ตารางข้อมูล
             Table(
              border: TableBorder.all(color: Colors.grey),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(3),
              },
              children: const [
                TableRow(
                  decoration: BoxDecoration(color: Colors.deepOrangeAccent),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'เมนู',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'รายละเอียด',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('คะน้าหมูกรอบ'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('650-800 เเคลอรี่'),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('โปรตีน'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('15-20 กรัม'),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('น้ำตาล'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('4–8 กรัม'),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(padding: EdgeInsets.all(8.0), child: Text('ไขมัน')),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('25–40 กรัม'),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('โซเดียม'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('1,000–1,500 กรัม'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
