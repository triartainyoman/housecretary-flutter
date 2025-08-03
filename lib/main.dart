import 'package:flutter/material.dart';
import 'package:housecretary/theme.dart';
import 'package:housecretary/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Housecretary',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainNavigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Center(child: Text('活動')),
    Center(child: Text('儀表板')),
    Center(child: Text('服務')),
    Center(child: Text('帳⼾')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(child: _pages[_currentIndex]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action
        },
        backgroundColor: primaryColor,
        shape: CircleBorder(),
        child: Icon(Icons.add, color: whiteColor),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '物件'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: '活動',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: '儀表板',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: '服務',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '帳⼾',
          ),
        ],
      ),
    );
  }
}
