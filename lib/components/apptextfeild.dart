import 'package:flutter/material.dart';
import 'package:fudiko/utils/constants.dart';

class AppTextFeild extends StatelessWidget {
  final String? text;
  final TextEditingController? controller;
  final IconData? icon;
  final IconData? suffixIcon;
  final int? maxlines;
  final double? size;
  final Color? iconColor;

  const AppTextFeild({
    super.key,
    this.text,
    this.controller,
    this.icon,
    this.suffixIcon,
    this.maxlines,
    this.size,
    this.iconColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 60,
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
          icon != null ? Icon(icon, color: iconColor ??Colors.grey) : SizedBox.shrink(),
          SizedBox(width: 12),
          Expanded(
            child: TextField(
              maxLines: maxlines ?? 1,
              controller: controller,
              cursorColor: appTextColor,
              decoration: InputDecoration(
                hintText: text,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  fontSize: size ?? 16
                ),
                border: InputBorder.none,
                isCollapsed: true,
                contentPadding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
          suffixIcon != null ? Icon(suffixIcon, color: Colors.grey,size: 40,) : SizedBox.shrink(),
        ],
      ),
    );
  }
}
