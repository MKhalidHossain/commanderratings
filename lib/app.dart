import 'package:flutter/material.dart';

import 'core/widgets/custom_bottom_nev_bar.dart';
import 'features/commanders/presentations/screens/all_commanders_screen.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/leaderboard/presentation/screens/leaderboard_screen.dart';
import 'features/more/presentation/screens/more_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    LeaderboardScreen(),
    AllCommandersScreen(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
