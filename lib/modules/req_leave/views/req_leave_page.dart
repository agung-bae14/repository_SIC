import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class ReqLeavePage extends StatefulWidget {
  const ReqLeavePage({super.key});

  @override
  State<ReqLeavePage> createState() => _ReqLeavePageState();
}

class _ReqLeavePageState extends State<ReqLeavePage> {
  String selectedType = 'Annual Leave';
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  final List<Map<String, dynamic>> leaveTypes = [
    {'title': 'Annual Leave', 'icon': Symbols.beach_access},
    {'title': 'Sick Leave', 'icon': Symbols.medical_services},
    {'title': 'Emergency Leave', 'icon': Symbols.emergency},
    {'title': 'Unpaid Leave', 'icon': Symbols.money_off},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff46b83d),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
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
                          'Apply for leave',
                          style: TextStyle(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          'Submit your leave request',
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.white70),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Leave Type',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                              color: Colors.black),
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          padding: EdgeInsets.all(15.r),
                          decoration: BoxDecoration(
                            color: const Color(0xfff0f0f0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: leaveTypes.map(
                              (type) {
                                bool isSelected = selectedType == type['title'];

                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedType = type['title'];
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 10.h),
                                    padding: EdgeInsets.all(12.r),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? const Color(0xffe8efff)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: isSelected
                                            ? const Color(0xff46b83d)
                                            : Colors.transparent,
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(8.r),
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? const Color(0xff46b83d)
                                                : const Color(0xffe0e0e0),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Icon(
                                            type['icon'],
                                            color: isSelected
                                                ? Colors.white
                                                : Colors.grey[600],
                                            size: 20.sp,
                                            fill: 1,
                                          ),
                                        ),
                                        SizedBox(width: 15.w),
                                        Expanded(
                                          child: Text(
                                            type['title'],
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600,
                                              color: isSelected
                                                  ? const Color(0xff46b83d)
                                                  : Colors.black87,
                                            ),
                                          ),
                                        ),
                                        if (isSelected)
                                          const Icon(
                                            Symbols.check_circle,
                                            color: Color(0xff46b83d),
                                            fill: 1,
                                          ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Date Range',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.sp),
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            Expanded(
                              child: _buildDateInput(
                                controller: _startDateController,
                                hint: 'Start Date',
                                icon: Symbols.today,
                              ),
                            ),
                            SizedBox(width: 15.w),
                            Expanded(
                              child: _buildDateInput(
                                controller: _endDateController,
                                hint: 'End Date',
                                icon: Symbols.event,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Reason',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14.sp),
                        ),
                        SizedBox(height: 12.h),
                        TextFormField(
                          controller: _reasonController,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: 'Enter your reason here...',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 14.sp),
                            filled: true,
                            fillColor: const Color(0xfff5f5f5),
                            contentPadding: EdgeInsets.all(15),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide:
                                  const BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                  color: Color(0xff46b83d), width: 1.5),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        SizedBox(
                          width: double.infinity,
                          height: 55.h,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff46b83d),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              elevation: 0,
                            ),
                            child: Text(
                              'Submit Request',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateInput({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary:
                      Color(0xff46b83d),
                ),
              ),
              child: child!,
            );
          },
        );
        if (pickedDate != null) {
          String formattedDate = DateFormat('dd MMM yyyy', 'id_ID').format(pickedDate);
        controller.text = formattedDate;
        }
      },
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 13.sp),
        prefixIcon: Icon(icon, color: const Color(0xff46b83d), size: 20.sp),
        filled: true,
        fillColor: const Color(0xfff5f5f5),
        contentPadding: EdgeInsets.symmetric(vertical: 15.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xff46b83d), width: 1),
        ),
      ),
    );
  }
}
