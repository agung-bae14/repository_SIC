import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:sic/controllers/page_index_controller.dart';

final pages = Get.find<PageIndexController>();

class PresensiPage extends StatelessWidget {
  PresensiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:35, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Presensi Saya Hari Ini',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    Image.asset(
                      'images/absence.png',
                      width: 60,
                      height: 60,
                    ),
              ],
            ),
            const SizedBox(height: 20),
            Text('Nama Karyawan', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text('NIP Karyawan', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Symbols.watch_check,
                          size: 80,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Masuk',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Jam',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
                const SizedBox(width: 20),
                Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Symbols.watch_arrow,
                          size: 80,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Keluar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Jam',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
            const SizedBox(height: 30),
            Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: const LinearGradient(
                        colors: [Colors.green, Colors.lightGreenAccent])),
                child: TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.white),
                    onPressed: () {
                      {}
                    },
                    child: const Text('Absen')))
          ],
        ),
      ),
      
    );
  }
}
