import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sic/controllers/page_index_controller.dart';
import 'package:sic/modules/home/controllers/home_controller.dart';
import 'package:sic/widget/card_user.dart';
import 'package:sic/widget/menu_widget.dart';

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
              padding: const EdgeInsets.only(top: 35,bottom: 20,left: 20,right: 20),
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
                  CardUser(namaKaryawan: "Nama Karyawan", jabatan: "Jabatan", kategori: "Kategori", nip: "NIP"),
                  const SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                          child: MenuWidget(
                        colorBg: const Color.fromARGB(255, 181, 231, 255),
                        iconPath: Icons.groups_outlined,
                        colorIc: Colors.blue,
                        title: 'HRIS',
                      )),
                      Expanded(
                          child: MenuWidget(
                        colorBg: const Color.fromARGB(255, 181, 255, 186),
                        iconPath: Icons.article_outlined,
                        colorIc: Colors.green,
                        title: "Pengajuan Online",
                      )),
                      Expanded(
                          child: MenuWidget(
                              colorBg: const Color.fromARGB(255, 255, 249, 208),
                              iconPath: Icons.apartment_outlined,
                              colorIc: Color.fromARGB(255, 171, 155, 12),
                              title: "Aset")),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                          child: MenuWidget(
                              colorBg: const Color.fromARGB(255, 249, 181, 255),
                              iconPath: Icons.rebase_edit,
                              colorIc: Colors.purple,
                              title: "RND")),
                      Expanded(
                          child: MenuWidget(
                              colorBg: const Color.fromARGB(255, 255, 186, 181),
                              iconPath: Icons.science_outlined,
                              colorIc: Colors.red,
                              title: "Knitting")),
                      Expanded(
                          child: MenuWidget(
                              colorBg: const Color.fromARGB(255, 234, 208, 255),
                              iconPath: Icons.camera_roll_outlined,
                              colorIc: Colors.deepPurple,
                              title: "Knitting Sock")),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                          child: MenuWidget(
                              colorBg: const Color.fromARGB(255, 181, 255, 255),
                              iconPath: Icons.api_outlined,
                              colorIc: Color.fromARGB(255, 56, 156, 156),
                              title: "RAW Material")),
                      Expanded(
                          child: MenuWidget(
                              colorBg: const Color.fromARGB(255, 234, 208, 255),
                              iconPath: Icons.tab_outlined,
                              colorIc: Colors.deepPurple,
                              title: "Aksesoris Inventory")),
                      Expanded(
                          child: MenuWidget(
                              colorBg: const Color.fromARGB(255, 181, 255, 186),
                              iconPath: Icons.card_travel_outlined,
                              colorIc: Colors.green,
                              title: "Rumah Jahit")),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                          child: MenuWidget(
                              colorBg: const Color.fromARGB(255, 249, 181, 255),
                              iconPath: Icons.bolt_outlined,
                              colorIc: Colors.purple,
                              title: "Quantum")),
                      Expanded(
                          child: MenuWidget(
                              colorBg: const Color.fromARGB(255, 181, 255, 186),
                              iconPath: Icons.monetization_on_outlined,
                              colorIc: Colors.green,
                              title: "Koperasi")),
                      Expanded(
                          child: MenuWidget(
                              colorBg: const Color.fromARGB(255, 255, 249, 208),
                              iconPath: Icons.calculate_outlined,
                              colorIc: Color.fromARGB(255, 171, 155, 12),
                              title: "AIS")),
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
