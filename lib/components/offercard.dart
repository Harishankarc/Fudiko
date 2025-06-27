import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/components/appswitch.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/models/offer/offer-status-change-model.dart';
import 'package:fudiko/services/offer-service.dart';

class OfferCard extends StatefulWidget {
  final String url;
  final VoidCallback deleteOnTap;
  final VoidCallback editOnTap;
  final String percentage;
  final String applicableFor;
  final String dineType;
  final String startTime;
  final String endTime;
  final String activeDays;
  final String status;
  final String uuid;

  const OfferCard({
    super.key,
    required this.url,
    required this.deleteOnTap,
    required this.editOnTap,
    required this.percentage,
    required this.applicableFor,
    required this.dineType,
    required this.startTime,
    required this.endTime,
    required this.activeDays,
    required this.status,
    required this.uuid
  });

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  bool isDeletePressed = false;
  OfferService offerService = OfferService();
  late String currentStatus;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    currentStatus = widget.status;
  }

  Future<void> changeStatus() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    try {
      OfferStatusChangeModel offer = OfferStatusChangeModel(widget.uuid);
      OfferStatusChangeReturnModel response = await offerService.changeStatus(offer);

      if (!mounted) return;

      if (response.status) {
        setState(() {
          currentStatus = currentStatus == "Active" ? "Inactive" : "Active";
        });
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.message))
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(response.message))
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'))
      );
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8.r,
            offset: Offset(0, 2.r),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top-right switch
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  AppSwitch(
                    initialValue: currentStatus == "Active",
                    onToggle: (val) {
                      if (!isLoading) {
                        changeStatus();
                      }
                    },
                  ),
                  if (isLoading)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(
                  widget.url,
                  height: 150.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: EdgeInsets.all(20.w),
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
                                  text: "${widget.percentage}%",
                                  size: 36,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 8.h),
                                AppText(
                                  text:
                                  "FOR ${widget.applicableFor.toUpperCase().split('_').join(' ')}",
                                  size: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            AppText(
                              text: widget.dineType
                                  .toUpperCase()
                                  .split(',')
                                  .join(' & '),
                              size: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/images/discounttag.png',
                        width: 100.w,
                        height: 100.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          Wrap(
            spacing: 10.w,
            runSpacing: 8.h,
            children: [
              _IconContainer(
                icon: Icons.access_time,
                label: "${widget.startTime} - ${widget.endTime}",
              ),
              _IconContainer(
                icon: Icons.calendar_month,
                label: widget.activeDays,
              ),
            ],
          ),
          SizedBox(height: 16.h),

          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 100.w,
                height: 35.h,
                child: _ActionButton(
                  label: 'Delete',
                  color: Colors.red,
                  onPressed: widget.deleteOnTap,
                ),
              ),
              SizedBox(width: 10.w),
              SizedBox(
                width: 100.w,
                height: 35.h,
                child: _ActionButton(
                  label: 'Edit',
                  color: Colors.blue,
                  onPressed: widget.editOnTap,
                ),
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
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12.w),
          SizedBox(width: 8.w),
          Flexible(
            child: Text(
              label,
              style: TextStyle(fontSize: 12.sp),
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

  _ActionButton({
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }
}