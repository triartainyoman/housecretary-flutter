import 'package:flutter/material.dart';
import 'package:housecretary/theme.dart';
import 'package:housecretary/widgets/house_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> houses = [
      {
        "imagePath": "assets/images/house/house_1.jpg",
        "title": "和築青樺",
        "address": "台南市安定區工業一路360號 3樓B室",
      },
      {
        "imagePath": "assets/images/house/house_2.jpg",
        "title": "美麗華樓",
        "address": "高雄市鼓山區美術南三路66號",
      },
      {
        "imagePath": "assets/images/house/house_3.jpg",
        "title": "華夏公寓",
        "address": "新北市板橋區文化路二段182巷8號",
      },
      {
        "imagePath": "assets/images/house/house_4.jpg",
        "title": "信義豪宅",
        "address": "台北市信義區信義路五段8號",
      },
    ];

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(height: gap),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Housecretary",
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // handle notification press
                        },
                        child: Icon(Icons.notifications_outlined, size: 24),
                      ),
                      SizedBox(width: 10), // exact gap between icons
                      GestureDetector(
                        onTap: () {
                          // handle QR scan press
                        },
                        child: Icon(Icons.qr_code_scanner, size: 24),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Text('屋秘', style: blackTextStyle.copyWith(fontSize: 16)),
            ),
            SizedBox(height: gap),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: TextField(
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  hintText: '請輸入地址、建案名稱或仲介姓名...',
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: greyColor),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
            ),
            SizedBox(height: gap),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Text(
                "您的房產列表",
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: houses.map((house) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: HouseCard(
                      imagePath: house['imagePath']!,
                      title: house['title']!,
                      address: house['address']!,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
