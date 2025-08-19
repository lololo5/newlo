import 'package:flutter/material.dart';

class E extends StatelessWidget {
  const E({super.key});

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
              'assets/images/ข้าวไข่เจียว.png', // เปลี่ยน path ให้ตรงกับรูปของคุณ
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            const Text(
              'ข้าวไข่เจียว',
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
                      child: Text('ข้าวไข่เจียว'),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('445-580 เเคลอรี่'),
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
                      child: Text('12–18 กรัม'),
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
                      child: Text('1–2 กรัม'),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Padding(padding: EdgeInsets.all(8.0), child: Text('ไขมัน')),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('30–40 กรัม'),
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
                      child: Text('500–1,000 กรัม'),
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
