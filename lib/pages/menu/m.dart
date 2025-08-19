import 'package:flutter/material.dart';

class m extends StatelessWidget {
  const m({super.key});

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
              'assets/images/หมูปิ้ง.png', // เปลี่ยน path ให้ตรงกับรูปของคุณ
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'หมูปิ้ง',
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
                      child: Text('หมูปิ้ง'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('150–200 เเคลอรี่'),
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
                      child: Text('10–15 กรัม'),
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
                      child: Text('2–5 กรัม'),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(padding: EdgeInsets.all(8.0), child: Text('ไขมัน')),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('8–12 กรัม'),
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
                      child: Text('400–700กรัม'),
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
