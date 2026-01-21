import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sic/controllers/page_index_controller.dart';
import 'package:sic/modules/home/controllers/home_controller.dart';
import 'package:sic/modules/presensi/views/presensi_page.dart';
import 'package:sic/widget/card_user.dart';

final pages = Get.find<PageIndexController>();

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset(
                        'images/sic-logo.png',
                        width: 150,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CardUser(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 181, 231, 255),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.groups_outlined,
                                    color: Colors.blue,
                                    size: 35,
                                  )),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "HRIS",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 181, 255, 186),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.article_outlined,
                                    color: Colors.green,
                                    size: 35,
                                  )),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Pengajuan Online",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 249, 208),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.apartment_outlined,
                                    color: Color.fromARGB(255, 171, 155, 12),
                                    size: 35,
                                  )),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Aset",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 249, 181, 255),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.rebase_edit,
                                    color: Colors.purple,
                                    size: 35,
                                  )),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "RND",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 186, 181),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.science_outlined,
                                    color: Colors.red,
                                    size: 35,
                                  )),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Knitting",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 234, 208, 255),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.camera_roll_outlined,
                                    color: Colors.deepPurple,
                                    size: 35,
                                  )),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Knitting Sock",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 181, 255, 255),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.api_outlined,
                                    color: Color.fromARGB(255, 56, 156, 156),
                                    size: 35,
                                  )),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "RAW Material",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 234, 208, 255),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.tab_outlined,
                                    color: Colors.deepPurple,
                                    size: 35,
                                  )),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Aksesoris Inventory",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 181, 255, 186),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.card_travel_outlined,
                                    color: Colors.green,
                                    size: 35,
                                  )),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Rumah Jahit",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 249, 181, 255),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.bolt_outlined,
                                    color: Colors.purple,
                                    size: 35,
                                  )),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Quantum",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 181, 255, 186),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.monetization_on_outlined,
                                    color: Colors.green,
                                    size: 35,
                                  )),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Koperasi",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 249, 208),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.calculate_outlined,
                                    color: Color.fromARGB(255, 171, 155, 12),
                                    size: 35,
                                  )),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "AIS",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ],
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}
