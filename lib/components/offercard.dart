import 'package:flutter/material.dart';
import 'package:fudiko/components/appswitch.dart';
import 'package:fudiko/components/apptext.dart';

class OfferCard extends StatefulWidget {
  final String url;
  final VoidCallback deleteOnTap;
  final VoidCallback editOnTap;

  const OfferCard({
    super.key,
    required this.url,
    required this.deleteOnTap,
    required this.editOnTap
  });

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  bool isDeletePressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top-right switch
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [AppSwitch(initialValue: true, onToggle: (val) {})],
          ),
          SizedBox(height: 10),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.url,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  text: "25%",
                                  size: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                AppText(
                                  text: "FOR ENTIRE MENU",
                                  size: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            AppText(
                              text: "Dine in & Take away",
                              size: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/images/discounttag.png',
                        width: 100,
                        height: 100,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Time and day row — FIXED by wrapping both in Flexible with flex
          Row(
            children: [
              Flexible(
                flex: 2,
                child: _IconContainer(
                  icon: Icons.access_time,
                  label: "02:30pm - 04:00pm",
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                flex: 3,
                child: _IconContainer(
                  icon: Icons.calendar_month,
                  label: "Mon Tue Wed Thur Fri Sat Sun",
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 100,
                child: _ActionButton(label: 'Delete', color: Colors.red,onPressed: widget.deleteOnTap,),
              ),
              SizedBox(width: 10),
              SizedBox(
                width: 100,
                child: _ActionButton(label: 'Edit', color: Colors.green,onPressed: widget.editOnTap,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _IconContainer extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconContainer({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, size: 12),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              label,
              style: TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const _ActionButton({required this.label, required this.color,required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
