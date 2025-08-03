import 'package:flutter/material.dart';
import 'package:housecretary/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final List<String> assetImages = [
    'assets/images/house/house_1.jpg',
    'assets/images/house/house_2.jpg',
    'assets/images/house/house_3.jpg',
    'assets/images/house/house_4.jpg',
  ];

  int _currentIndex = 0;
  final CarouselSliderController carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(title: const Text('詳細頁面'), centerTitle: true),
      body: SafeArea(
        child: ListView(
          children: [
            // Carousel with arrows
            Stack(
              children: [
                CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: assetImages.length,
                  itemBuilder: (context, index, realIndex) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(assetImages[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 270,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),

                // Left arrow (only show if not first item)
                if (_currentIndex > 0)
                  Positioned(
                    left: 10,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: GestureDetector(
                        onTap: () => carouselController.previousPage(),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.50),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.chevron_left,
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                // Right arrow (only show if not last item)
                if (_currentIndex < assetImages.length - 1)
                  Positioned(
                    right: 10,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: GestureDetector(
                        onTap: () => carouselController.nextPage(),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.50),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.chevron_right,
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                // Indicator
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 14,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: assetImages.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () =>
                            carouselController.animateToPage(entry.key),
                        child: Container(
                          width: 50,
                          height: 4,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            color: _currentIndex == entry.key
                                ? blackColor
                                : strokeColor,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),

            SizedBox(height: gap),

            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: edge),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "和築青樺",
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "3280萬元",
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.square_foot, color: greyColor),
                          SizedBox(width: 4),
                          Text("32.5 坪", style: greyTextStyle),
                        ],
                      ),
                      SizedBox(width: 10),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.home_outlined, color: greyColor),
                          SizedBox(width: 4),
                          Text("3房2廳2衛", style: greyTextStyle),
                        ],
                      ),
                      SizedBox(width: 10),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.fmd_good_outlined, color: greyColor),
                          SizedBox(width: 4),
                          Text("台北市信義區", style: greyTextStyle),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: gap),

            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: edge),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "關於此房產",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "坐落於信義區核心地段的現代三房電梯大樓。本物件位於 9 樓，室內坪數為 32.5 坪，格局方正，採光佳，擁有開放式廚房與陽台景觀。社區提供 24 小時管理、電梯、地下停車位, 生活機能便利, 鄰近台北101與捷運象山站, 適合家庭或專業人士入住。",
                    style: blackTextStyle.copyWith(height: 24 / 14),
                  ),
                ],
              ),
            ),

            SizedBox(height: gap),

            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: edge),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "房地產代理資訊",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Profile
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(20),
                              child: Image.asset(
                                "assets/images/profile.jpg",
                                height: 60,
                                width: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 14),
                            // Column
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "陳冠宇",
                                  style: blackTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("0912-345-678", style: blackTextStyle),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          padding: EdgeInsets.all(10),
                          icon: Icon(
                            Icons.call_outlined,
                            color: whiteColor,
                            size: 24,
                          ),
                          style: IconButton.styleFrom(
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: gap),

            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: edge),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "地圖與地址",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(30),
                    child: Image.asset("assets/images/location.jpg"),
                  ),
                  SizedBox(height: 6),
                  Text("台北市信義區松仁路123號 9樓之3", style: blackTextStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
