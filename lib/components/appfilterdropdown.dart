import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFilterDropDown extends StatefulWidget {
  final List<String>? items;
  final String hint;
  final IconData? icon;
  final IconData? suffixIcon;
  final Color? textColor;
  final double? height;
  final VoidCallback? toogleDropdown;

  const AppFilterDropDown({
    super.key,
    this.items,
    required this.hint,
    this.icon,
    this.suffixIcon,
    this.textColor,
    this.height,
    this.toogleDropdown
  });

  @override
  _AppFilterDropDownState createState() => _AppFilterDropDownState();
}

class _AppFilterDropDownState extends State<AppFilterDropDown> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: widget.toogleDropdown,
          child: Container(
            height: widget.height?.h ?? 45.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (widget.icon != null)
                  Positioned(
                    left: 12.w,
                    child: Icon(widget.icon, size: 15.w, color: Colors.black87),
                  ),

                Center(
                  child: Text(
                    selectedValue ?? widget.hint,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: widget.textColor ?? Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                Positioned(
                  right: 12.w,
                  child: Icon(
                    isOpen
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 15.w,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
