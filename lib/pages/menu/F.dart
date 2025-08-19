import 'package:flutter/material.dart';

class F extends StatelessWidget {
  const F({super.key});

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
              'assets/images/ข้าวผัด.png', // เปลี่ยน path ให้ตรงกับรูปของคุณ
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'ข้าวผัด',
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
                      child: Text('ข้าวผัด'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('550-650 เเคลอรี่'),
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
                      child: Text('10–20 กรัม'),
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
                      child: Text('15–30 กรัม'),
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
                      child: Text('800–1,200 กรัม'),
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
