import 'package:flutter/material.dart';

class Bottomnav extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const Bottomnav({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      {'label': 'Reservation', 'icon': Icons.event_available, 'badge': 2},
      {'label': 'Banquet', 'icon': Icons.wine_bar, 'badge': 1},
      {'label': 'Offers', 'icon': Icons.percent, 'badge': 0},
      {'label': 'Take Away', 'icon': Icons.delivery_dining, 'badge': 0},
      {'label': 'Profile', 'icon': Icons.person, 'badge': 0},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 50, offset: Offset.zero),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(
                      item['icon'] as IconData,
                      size: 28,
                      color: isSelected ? Colors.orange : Colors.grey[700],
                    ),
                    if ((item['badge'] as int) > 0)
                      Positioned(
                        top: -6,
                        right: -6,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 20,
                            minHeight: 20,
                          ),
                          child: Center(
                            child: Text(
                              '${item['badge']}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  item['label'] as String,
                  style: TextStyle(
                    color: isSelected ? Colors.orange : Colors.grey[700],
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
