import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class OvertimePage extends StatefulWidget {
  const OvertimePage({super.key});

  @override
  State<OvertimePage> createState() => _OvertimePageState();
}

class _OvertimePageState extends State<OvertimePage> {
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
                          'Overtime',
                          style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'Manage your overtime records',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xff46b83d),
                                    ),
                                    child: Icon(
                                      Symbols.schedule,
                                      fill: 1,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Overtime \nStatus',
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        SizedBox(height: 3.h),
                                        Text(
                                          'Waiting for approval',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black
                                                  .withOpacity(0.6)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color(0xfffff3e0),
                                      border: Border.all(
                                        color: const Color(0xffffe0b2),
                                      ),
                                    ),
                                    child: Text(
                                      'Completed',
                                      style: TextStyle(
                                          color: const Color(0xfff57c00),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: 30,
                                thickness: 2,
                                color: Colors.black12,
                              ),
                              Row(children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () => _showOvertimeDialog(
                                        title: 'Reason for Overtime',
                                        isCheckIn: true),
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xffe8f5e9),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Symbols.login,
                                            color: Color(0xff4caf50),
                                            weight: 1000,
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Check In',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 14.sp,
                                                  color: Color(0xff4caf50),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color(0xffffebee),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Symbols.logout,
                                          color: Color(0xffe53935),
                                          weight: 1000,
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Check Out',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 14.sp,
                                                color: Color(0xffe53935),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                              SizedBox(height: 15.h),
                              Container(
                                padding: EdgeInsets.all(10),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xfffff3e0)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Symbols.pending_actions,
                                      color: const Color(0xfff57c00),
                                      weight: 1000,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        'overtime completed, awaiting approval',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 14.sp,
                                            color: const Color(0xfff57c00)),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'History',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        OvertimeHistoryCard(
                          date: "Kam, 02 Okt 2025",
                          status: "Pending",
                          startTime: "17:30",
                          endTime: "21:00",
                          reason: "Memperbaiki bug",
                          notes: "-",
                        ),
                        OvertimeHistoryCard(
                          date: "Rab, 01 Okt 2025",
                          status: "Approved",
                          startTime: "17:00",
                          endTime: "18:00",
                          reason: "Memperbaiki bug",
                          notes: "-",
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

  void _showOvertimeDialog({required String title, required bool isCheckIn}) {
    TextEditingController controller = TextEditingController();

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15.h),
              TextField(
                controller: controller,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: isCheckIn
                      ? 'Write the reason for overtime...'
                      : 'Write a note on overtime results...',
                  filled: true,
                  fillColor: const Color(0xfff5f5f5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Color(0xff46b83d),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Batal'),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print("Data: ${controller.text}");
                        Get.back();
                        Get.snackbar(
                            "Succeed", "Overtime data has been updated",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green,
                            colorText: Colors.white);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff46b83d),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Simpan'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OvertimeHistoryCard extends StatelessWidget {
  final String date;
  final String status;
  final String startTime;
  final String endTime;
  final String reason;
  final String notes;

  const OvertimeHistoryCard({
    super.key,
    required this.date,
    required this.status,
    required this.startTime,
    required this.endTime,
    required this.reason,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStatusBadge(status),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: _buildTimeBox(
                  label: "Start Time",
                  time: startTime,
                  icon: Symbols.login,
                  color: const Color(0xff46b83d),
                  bgColor: const Color(0xffe8f5e9),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildTimeBox(
                  label: "End Time",
                  time: endTime,
                  icon: Symbols.logout,
                  color: const Color(0xffe53935),
                  bgColor: const Color(0xffffebee),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          _buildInfoBox(
            label: "Reason",
            value: reason,
            icon: Symbols.notes,
          ),
          // SizedBox(height: 10.h),
          // _buildInfoBox(
          //   label: "Notes",
          //   value: notes,
          //   icon: Symbols.description,
          // ),
        ],
      ),
    );
  }

  Widget _buildTimeBox({
    required String label,
    required String time,
    required IconData icon,
    required Color color,
    required Color bgColor,
  }) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 24.r, weight: 600),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: TextStyle(
                      fontSize: 11.sp, color: color.withOpacity(0.7))),
              Text(time,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: color)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox(
      {required String label, required String value, required IconData icon}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xfff5f5f5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18.r, color: Colors.blueAccent),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: TextStyle(fontSize: 11.sp, color: Colors.grey)),
                Text(value,
                    style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    IconData icon;
    Color bgColor;
    Color borderColor;
    Color textColor;
    if (status == 'Approved') {
      icon = Symbols.check_circle;
      bgColor = const Color(0xffe8f5e9);
      textColor = const Color(0xff4caf50);
      borderColor = const Color(0xffc8e6c9);
    } else if (status == 'Pending') {
      icon = Symbols.pending_actions;
      bgColor = const Color(0xfffff3e0);
      textColor = const Color(0xfff57c00);
      borderColor = const Color(0xffffe0b2);
    } else {
      icon = Symbols.cancel;
      bgColor = const Color(0xffffebee);
      textColor = const Color(0xffe53935);
      borderColor = const Color(0xffffcdd2);
    }

    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: textColor,
          ),
          child: Icon(icon, color: Colors.white, fill: 1, size: 30),
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 4.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: borderColor),
              ),
              child: Text(
                status,
                style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                    color: textColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
