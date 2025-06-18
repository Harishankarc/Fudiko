import 'package:flutter/material.dart';
import 'package:fudiko/utils/constants.dart';

class AppDropDown extends StatefulWidget {
  final List<String>? items;
  final String hint;
  final IconData? icon;
  final IconData? suffixIcon;
  final Color? textColor;
  final VoidCallback? toggleDropdown;

  const AppDropDown({
    super.key,
    this.items,
    required this.hint,
    this.icon,
    this.suffixIcon,
    this.textColor,
    this.toggleDropdown
  });

  @override
  _AppDropDownState createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  String? selectedValue;
  bool isOpen = false;



  void selectItem(String value) {
    setState(() {
      selectedValue = value;
      isOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: widget.toggleDropdown,
            child: Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  if (widget.icon != null)
                    Icon(widget.icon, color: Colors.grey),
                  if (widget.icon != null) SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      selectedValue ?? widget.hint,
                      style: TextStyle(
                        fontSize: 16,
                        color: selectedValue == null
                            ?  Colors.grey
                            : Colors.black,
                        fontWeight: selectedValue == null
                            ? FontWeight.w400
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                  Icon(
                    isOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: Colors.grey,
                    size: 40,
                  ),
                ],
              ),
            ),
          ),



        ],
      ),
    );
  }
}
