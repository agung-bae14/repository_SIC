import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:sic/routes/app_pages.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({super.key});

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff46b83d),
            Color(0xffd8dbd2),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Container(
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(0.2),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1,
                            )),
                        child: const Icon(
                          Symbols.arrow_back_ios_new,
                          size: 25,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Leave Requests',
                          style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'Track and manage your leave history',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.white70),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(0.2),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1.5,
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white.withOpacity(0.2),
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.3),
                                          width: 1,
                                        )),
                                    child: const Icon(
                                      Symbols.calendar_month,
                                      size: 30,
                                      fill: 1,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Total Leaves',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Colors.white.withOpacity(0.8),
                                        ),
                                      ),
                                      Text(
                                        '2 Requests',
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white),
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.white),
                                  onPressed: () {
                                    Get.toNamed(Routes.REQ_LEAVE);
                                  },
                                  child: Text(
                                    'Apply for Leave',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff46b83d)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        LeaveStatusCard(
                          title: 'Annual Leave',
                          dateRange: '15 Nov 2026 - 06 Des 2026',
                          totalDays: '1 day',
                          reason: 'Sample leave request for testing',
                          status: 'Pending',
                          approver: 'Awaiting assignment',
                        ),
                        LeaveStatusCard(
                          title: 'Annual Leave',
                          dateRange: '08 Agu 2026 - 08 Sep 2026',
                          totalDays: '10 day',
                          reason: 'Sample leave request for testing',
                          status: 'Rejected',
                          approver: 'Admin',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LeaveStatusCard extends StatelessWidget {
  final String title;
  final String dateRange;
  final String totalDays;
  final String reason;
  final String status;
  final String approver;

  const LeaveStatusCard({
    super.key,
    required this.title,
    required this.dateRange,
    required this.totalDays,
    required this.reason,
    required this.status,
    required this.approver,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Color(0xff46b83d),
                    ),
                    child: const Icon(Symbols.beach_access,
                        color: Colors.white, fill: 1, size: 30),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          dateRange,
                          style: TextStyle(
                              fontSize: 13.sp, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  _buildStatusBadge(status),
                ],
              ),
              SizedBox(height: 20.h),
              _buildDetailRow(Symbols.schedule, "Total Days", totalDays),
              SizedBox(height: 10.h),
              _buildDetailRow(Symbols.description, "Reason", reason),
              SizedBox(height: 10.h),
              _buildDetailRow(Symbols.shield_person, "Approver", approver),
            ],
          ),
        ),
        SizedBox(height: 10.h)
      ],
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xfff5f5f5),
          ),
          child: Icon(
            icon,
            size: 25,
            fill: 1,
            color: Color(0xff46b83d),
          ),
        ),
        SizedBox(width: 15.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
              Text(
                value,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusBadge(String status) {
    Color bgColor;
    Color textColor;
    if (status == 'Pending') {
      bgColor = const Color(0xfffff4e5);
      textColor = Colors.orange;
    } else if (status == 'Approved') {
      bgColor = const Color(0xffe8f5e9);
      textColor = Colors.green;
    } else {
      bgColor = const Color(0xffffebee);
      textColor = Colors.red;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(20.r)),
      child: Text(
        status,
        style: TextStyle(
            fontSize: 12.sp, fontWeight: FontWeight.bold, color: textColor),
      ),
    );
  }
}
