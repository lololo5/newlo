import 'package:flutter/material.dart';

class Lo extends StatefulWidget {
  const Lo({super.key});

  @override
  State<Lo> createState() => _LoState();
}

class _LoState extends State<Lo> {
  final TextEditingController _foodController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  String _formatCal(double cal) {
    if (cal == cal.toInt()) {
      return cal.toInt().toString(); // ไม่มีจุดทศนิยม
    } else {
      return cal.toStringAsFixed(2); // มีจุดทศนิยมถ้ามีเศษ
    }
  }

  final Map<String, double> foodCalories = {
    'ข้าวสวย': 200.0,
    'ไข่ต้ม': 78.0,
    'อกไก่': 165.0,
    'กล้วย': 89.0,
    'ข้าว': 200,
    'ข้าวผัด': 550,
    'ข้าวผัดกุ้ง': 550,
    'หมูกรอบ': 475,
    'ข้าวมันไก่': 650,
    'ข้าวหมูกรอบ': 823,
    'ข้าวหมูเเดง': 610,
    'ข้าวขาหมู': 700,
    'ลาบหมู': 180,
    'หมูน้ำตก': 180,
    'ข้าวมันไก่ทอด': 770,
    'ข้าวไก่กรอบ': 725,
    'ข้าวไข่เจียว': 445,
    'กะเพราหมูกรอบ': 826,
    'กะเพราหมูสับ': 584,
    'กะเพรา': 584,
    'กะเพราหมูกรอบไข่ดาว': 754,
    'ข้าวต้ม': 290,
    'ข้าวต้มหมู': 290,
    'ส้มตำ': 120,
    'ต้มยำกุ้ง': 118,
    'ข้าวยำไก่เเซ่บ': 640,
    'ก๋วยเตี๋ยว': 400,
    'ปลาเผา': 320,
    'ผัดผักบุ้ง': 175,
    'คะน้าหมูกรอบ': 690,
    'คะน้าหมูชิ้น': 455,
    'ผัดไทย': 450,
    'ข้าวคลุกกะปิ': 650,
    'ไก่ทอด': 250,
    'ทอดไก่': 250,
    'ไก่ย้าง': 200,
    'ต้มข่าไก่': 250,
    'ไก่จ้อ': 150,
    'ไก่ป๊อบ': 65,
    'ลาบไก่': 265,
    'ลาบปลา': 220,
    'สปาเกสตี้': 550,
    'เเกงกระหรี่': 440,
    'หมูปิ้ง': 177,
    'ข้าวเหนียว': 125,
    'ปิ้งไก่': 180,
    'น้ำโค้ก': 150,
    'โค้ก': 150,
    'โค้กซีโร่': 10,
    'ทัมทิมกรอบ': 160,
    'ลอดช่อง': 224,
    'ข้าวเหนียวทุเรียน': 410,
    'ข้าวเหนียวเผือก': 320,
    'ข้าวเหนียวมะม่วง': 405,
    'บัวลอยไข่หวาน': 220,
    'บัวลอยเผือก': 220,
    'บัวลอยฝักทอง': 222,
    'กล้วยบวชชี': 250,
    'ขนมขั้น': 180,
    'ขนมหม้อเเกง': 190,
    'ทองหยอด': 200,
    'ฝอยทอง': 200,
    'เฉาก๊วย': 130,
    'ลูกชุบ': 150,
    'วุ้นมะพร้าว': 140,
    'ขนมดอกบัว': 160,
    'สังขยา': 220,
    'กล้วยทอด': 200,
    'ขนมครก': 180,
    'มาม่า': 360,
    'ไข่ดาว': 130,
    'ซาลาเปา': 250,
    'ขนมจีบ': 60,
    'แอปเปิ้ล': 95,
    'ส้ม': 60,
    'ฝรั่ง': 115,
    'มะม่วง': 130,
  };

  List<Map<String, dynamic>> foodList = [];
  double totalCalories = 0.0;

  void addFood() {
    final food = _foodController.text.trim();
    final amount = double.tryParse(_amountController.text.trim()) ?? 0;

    if (foodCalories.containsKey(food) && amount > 0) {
      double cal = foodCalories[food]! * amount;

      setState(() {
        foodList.add({'name': food, 'amount': amount, 'calories': cal});

        totalCalories += cal;

        _foodController.clear();
        _amountController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('ขออภัยครับ ระบบยังไม่มีเมนูนี้')),
      );
    }
  }

  void reset() {
    setState(() {
      foodList.clear();
      totalCalories = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: const Text('คำนวณแคลอรี่อาหาร'),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // ช่องกรอกข้อมูล
            TextField(
              controller: _foodController,
              decoration: InputDecoration(
                labelText: 'ชื่ออาหาร (เช่น ข้าวมันไก่)',
                prefixIcon: const Icon(Icons.restaurant_menu),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'จำนวน (เช่น 1,2,3)',
                prefixIcon: const Icon(Icons.format_list_numbered),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: addFood,
              icon: const Icon(Icons.add),
              label: const Text('เพิ่มรายการอาหาร'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                minimumSize: const Size(double.infinity, 50),
                textStyle: const TextStyle(fontSize: 16),
                foregroundColor: const Color.fromARGB(255, 4, 5, 4),
              ),
            ),

            const SizedBox(height: 20),
            const Divider(),

            // รายการอาหารวันนี้
            const Text(
              'รายการอาหารวันนี้',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: foodList.isEmpty
                  ? const Center(child: Text('ยังไม่มีรายการอาหาร'))
                  : ListView.builder(
                      itemCount: foodList.length,
                      itemBuilder: (context, index) {
                        final item = foodList[index];
                        return Card(
                          elevation: 3,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            leading: const Icon(
                              Icons.fastfood,
                              color: Colors.yellow,
                            ),
                            title: Text(
                              '${item['name']} ${_formatCal(item['amount'])}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              'พลังงาน ${_formatCal(item['calories'])} kcal',
                            ),
                          ),
                        );
                      },
                    ),
            ),
            const Divider(),
            Text(
              'รวมทั้งหมด: ${_formatCal(totalCalories)} kcal',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            ElevatedButton.icon(
              onPressed: reset,
              icon: const Icon(Icons.refresh),
              label: const Text('เริ่มใหม่'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                minimumSize: const Size(double.infinity, 45),
                foregroundColor: const Color.fromARGB(255, 4, 5, 4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
