import 'package:flutter/material.dart';

class Tool extends StatefulWidget {
  const Tool({super.key});

  @override
  State<Tool> createState() => _ToolState();
}

class _ToolState extends State<Tool> {
  String gender = 'ชาย';
  double age = 25;
  double weight = 65;
  double height = 170;
  double activityFactor = 1.2;
  String goal = 'คงน้ำหนัก'; // ✅ เพิ่มตัวแปรเป้าหมาย
  double result = 0;

  void calculateCalories() {
    double bmr;

    if (gender == 'ชาย') {
      bmr = 10 * weight + 6.25 * height - 5 * age + 5;
    } else {
      bmr = 10 * weight + 6.25 * height - 5 * age - 161;
    }

    double tdee = bmr * activityFactor;

    double adjustedCalories;
    if (goal == 'ลดน้ำหนัก') {
      adjustedCalories = tdee * 0.8; // ลด 20%
    } else if (goal == 'เพิ่มน้ำหนัก') {
      adjustedCalories = tdee * 1.1; // เพิ่ม 10%
    } else {
      adjustedCalories = tdee; // คงน้ำหนัก
    }

    setState(() {
      result = adjustedCalories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แคลอรี่ที่ควรได้รับ'),
        backgroundColor: Colors.green
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.local_fire_department,
                  color: Colors.green,
                  size: 60,
                ),
                SizedBox(height: 10),
                Text(
                  'ระบบคำนวณแคลอรี่ต่อวัน',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),

                /// Gender
                Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 10),
                    Expanded(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: gender,
                        onChanged: (value) => setState(() => gender = value!),
                        items: ['ชาย', 'หญิง']
                            .map(
                              (g) => DropdownMenuItem(value: g, child: Text(g)),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                /// Age
                TextField(
                  decoration: InputDecoration(
                    labelText: 'อายุ (ปี)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.cake),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => age = double.tryParse(value) ?? 0,
                ),
                SizedBox(height: 16),

                /// Weight
                TextField(
                  decoration: InputDecoration(
                    labelText: 'น้ำหนัก (กก.)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.monitor_weight),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => weight = double.tryParse(value) ?? 0,
                ),
                SizedBox(height: 16),

                /// Height
                TextField(
                  decoration: InputDecoration(
                    labelText: 'ส่วนสูง (ซม.)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => height = double.tryParse(value) ?? 0,
                ),
                SizedBox(height: 16),

                /// Activity Level
                Row(
                  children: [
                    Icon(Icons.fitness_center),
                    SizedBox(width: 10),
                    Expanded(
                      child: DropdownButton<double>(
                        isExpanded: true,
                        value: activityFactor,
                        onChanged: (value) =>
                            setState(() => activityFactor = value!),
                        items: [
                          DropdownMenuItem(
                            value: 1.2,
                            child: Text('ไม่ออกกำลังกายเลย'),
                          ),
                          DropdownMenuItem(
                            value: 1.375,
                            child: Text('ออกกำลังกาย 1 วันต่อสัปดาห์'),
                          ),
                          DropdownMenuItem(
                            value: 1.55,
                            child: Text('ออกกำลังกาย 2-3 วันต่อสัปดาห์'),
                          ),
                          DropdownMenuItem(
                            value: 1.725,
                            child: Text('ออกกำลังกาย 3-6 วันต่อสัปดาห์'),
                          ),
                          DropdownMenuItem(
                            value: 1.9,
                            child: Text('นักกีฬา'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                /// Goal (ลด/คง/เพิ่มน้ำหนัก)
                Row(
                  children: [
                    Icon(Icons.flag),
                    SizedBox(width: 10),
                    Expanded(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: goal,
                        onChanged: (value) => setState(() => goal = value!),
                        items: ['ลดน้ำหนัก', 'คงน้ำหนัก', 'เพิ่มน้ำหนัก']
                            .map(
                              (g) => DropdownMenuItem(value: g, child: Text(g)),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),

                /// Button
                ElevatedButton.icon(
                  onPressed: calculateCalories,
                  icon: Icon(Icons.calculate),
                  label: Text('คำนวณ'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 30),

                /// Result
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.deepOrange[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    result == 0
                        ? 'กรุณากรอกข้อมูลให้ครบแล้วกด "คำนวณ"'
                        : 'เป้าหมายของคุณคือ "$goal"\nคุณควรได้รับ\n${result.toStringAsFixed(2)} kcal ต่อวัน',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
