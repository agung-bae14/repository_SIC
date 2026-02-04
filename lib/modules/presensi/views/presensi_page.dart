import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:sic/controllers/page_index_controller.dart';

final pages = Get.find<PageIndexController>();

class PresensiPage extends StatefulWidget {
  PresensiPage({super.key});

  @override
  State<PresensiPage> createState() => _PresensiPageState();
}

class _PresensiPageState extends State<PresensiPage> {
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
              padding: const EdgeInsets.only(
                  top: 35, bottom: 25, right: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Attendance History',
                      style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text('Track your daily attendance records',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.white70)),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          HistoryStatusCard(
                            date: 'Senin, 25 Desember 2026',
                            status: 'On Time',
                            inTime: '08:01:13',
                            outTime: '17:00:25',
                          ),
                          HistoryStatusCard(
                            date: 'Minggu, 24 Desember 2026',
                            status: 'Late',
                            inTime: '09:04:48',
                            outTime: '17:01:23',
                            lateTime: '124 Menit',
                          ),
                          HistoryStatusCard(
                            date: 'Sabtu, 23 Desember 2026',
                            status: 'Absent',
                            inTime: '08:01:13',
                            outTime: '-',
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}

class HistoryStatusCard extends StatelessWidget {
  final String date;
  final String status;
  final String inTime;
  final String outTime;
  final String? lateTime;

  const HistoryStatusCard({
    super.key,
    required this.date,
    required this.status,
    required this.inTime,
    required this.outTime,
    this.lateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            children: [
              _buildStatusBadge(status),
              const SizedBox(height: 20),
              Container(
                height: 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black12,
                ),
              ),
              const SizedBox(height: 20),
              Row(children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffe8f5e9),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Symbols.login,
                          color: Color(0xff4caf50),
                          weight: 1000,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Check In',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.sp,
                                    color: Color(0xff4caf50))),
                            Text(inTime,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                    color: Color(0xff4caf50)))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffffebee),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Symbols.logout,
                          color: Color(0xffe53935),
                          weight: 1000,
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Check Out',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14.sp,
                                    color: Color(0xffe53935))),
                            Text(outTime,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                    color: Color(0xffe53935)))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ]),
              const SizedBox(height: 20),
              if (lateTime != null && lateTime!.isNotEmpty) ...[
                _buildLateCard(lateTime!),
              ],
            ],
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildLateCard(String timeLate) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffffebee)),
      child: Row(
        children: [
          Icon(
            Symbols.schedule,
            color: Color(0xffe53935),
            weight: 1000,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Late',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp,
                    color: Color(0xffe53935)),
              ),
              Text(
                lateTime!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: Color(0xffe53935),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status) {
    IconData icon;
    Color bgColor;
    Color borderColor;
    Color textColor;
    if (status == 'On Time') {
      icon = Symbols.check_circle;
      bgColor = const Color(0xffe8f5e9);
      textColor = const Color(0xff4caf50);
      borderColor = const Color(0xffc8e6c9);
    } else if (status == 'Late') {
      icon = Symbols.schedule;
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
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: textColor),
          child: Icon(icon, fill: 1, size: 30, color: Colors.white),
        ),
        const SizedBox(width: 10),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: bgColor,
                border: Border.all(
                  color: borderColor,
                ),
              ),
              child: Text(
                status,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp),
              ),
            ),
          ],
        ))
      ],
    );
  }
}
