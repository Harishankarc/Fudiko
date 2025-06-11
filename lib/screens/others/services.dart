import 'package:flutter/material.dart';
import 'package:fudiko/components/appswitch.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/utils/constants.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  final List<String> distances = [
    'Up to 1 km',
    'Up to 2 km',
    'Up to 3 km',
    'Up to 4 km',
    'Up to 5 km',
    'Up to 6 km',
    'Up to 7 km',
    'Up to 8 km',
    'Up to 9 km',
    'Up to 10 km',
    'More than 10 km',
  ];

  Set<String> selectedDistances = {'Up to 1 km'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric( vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 30,
                    color: Colors.deepOrange,
                  ),
                ),
                const SizedBox(height: 60),
                Divider(color: Colors.deepOrange.shade100, thickness: 1),

                _buildServiceRow("Takeaway service"),
                Divider(color: Colors.deepOrange.shade100, thickness: 1),

                _buildServiceRow("Delivery service"),
                const SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _buildDistanceGrid(),
                ),

                const SizedBox(height: 20),
                Divider(color: Colors.deepOrange.shade100, thickness: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildServiceRow(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            text: label,
            size: 15,
            fontWeight: FontWeight.w500,
            color: Colors.deepOrange,
          ),
          AppSwitch(initialValue: true, onToggle: (val) {}),
        ],
      ),
    );
  }

  Widget _buildDistanceGrid() {
    final left = distances.sublist(0, 5);
    final right = distances.sublist(5, 10);
    final last = distances[10];

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(children: left.map(_buildCheckboxRow).toList()),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(children: right.map(_buildCheckboxRow).toList()),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Center(child: _buildCheckboxRow(last)),
      ],
    );
  }

  Widget _buildCheckboxRow(String text) {
    final isChecked = selectedDistances.contains(text);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: TextStyle(fontSize: 15, color: appTextColor2)),
          const SizedBox(width: 20),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isChecked ? appToggleColor : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: appToggleColor, width: 2),
            ),
            child: Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    selectedDistances.add(text);
                  } else {
                    selectedDistances.remove(text);
                  }
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              side: BorderSide.none,
              checkColor: Colors.white,
              activeColor: appToggleColor,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}
