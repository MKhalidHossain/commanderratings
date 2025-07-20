import 'package:flutter/material.dart';

// Optional custom icon package
final int colorInt = 0xfdecbb;

// Create a Color object
final Color myColor = Color(colorInt);

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;
    final bottomPadding = bottomInset > 0 ? bottomInset -15.0 : 16.0;
    //final double bottomInset = MediaQuery.of(context).padding.bottom;
    //final bottomInset = MediaQuery.of(context).padding.bottom;

    //final effectiveBottomPadding = bottomInset > 0 ? bottomInset.clamp(0.0, 30.0) : 0.0;
    return Padding(
      // padding: EdgeInsets.only(bottom: bottomInset > 0 ? bottomInset : 8),
      //padding: EdgeInsets.only(bottom: effectiveBottomPadding),
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1A1A),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, 'Home', 0),
            _buildNavItem(Icons.emoji_events_outlined, 'Leaderboard', 1),
            _buildNavItem(Icons.groups_3_outlined, 'Commanders', 2),
            _buildNavItem(Icons.more_horiz, 'More', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.amberAccent.shade100 : Colors.grey[400],
            size: 26,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color:
                  isSelected ? Colors.amberAccent.shade100 : Colors.grey[400],
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
