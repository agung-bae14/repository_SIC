import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:sic/controllers/page_index_controller.dart';

final pages = Get.find<PageIndexController>();

class PresensiPage extends StatefulWidget {
  PresensiPage({super.key});

  @override
  State<PresensiPage> createState() => _PresensiPageState();
}

class _PresensiPageState extends State<PresensiPage> {
  File? image;
  final picker = ImagePicker();
  String lokasiAbsen = '';
  double latitude = 0.0;
  double longitude = 0.0;
  String tanggalAbsen = '';
  String waktuAbsen = '';
  int jamAbsen = 0;
  int menitAbsen = 0;
  String statusAbsen = '';
  double latKantor = -6.945009909734282;
  double longKantor = 107.75221805398144;
  double jarakMaksimal = 150.0;
  double jarakSekarang = 0.0;

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });

      setDateTime();
      setStatusAbsen();

      Get.dialog(
        const Center(
            child: CircularProgressIndicator(
          backgroundColor: Colors.green,
        )),
        barrierDismissible: false,
      );

      await getGeoLocationPosition();

      Get.back();

      Get.defaultDialog(
        title: "Konfirmasi Presensi",
        titleStyle: const TextStyle(fontWeight: FontWeight.bold),
        content: Column(
          children: [
            // Preview Gambar
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(File(pickedFile.path),
                  height: 150, fit: BoxFit.cover),
            ),
            const SizedBox(height: 15),
            // Detail Data
            buildDetailRow("File", pickedFile.name),
            buildDetailRow("Tanggal", tanggalAbsen),
            buildDetailRow("Waktu", waktuAbsen),
            const Divider(),
            const Text("Lokasi:",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
            Text(
              lokasiAbsen.isEmpty ? "Mencari lokasi..." : lokasiAbsen,
              style: const TextStyle(fontSize: 11),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        confirm: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {
            if (jarakSekarang <= jarakMaksimal) {
              Get.back();
              Get.snackbar("Berhasil", "Presensi berhasil dikirim");
            } else {
              Get.back();
              Get.snackbar("Error", "Anda berada di luar area kantor");
            }
          },
          child:
              const Text("Kirim Absen", style: TextStyle(color: Colors.white)),
        ),
        cancel: OutlinedButton(
          onPressed: () => Get.back(),
          child: const Text("Batal"),
        ),
      );
    }
  }

  Widget buildDetailRow(String label, String value,
      {Color color = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$label:",
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                  fontSize: 12,
                  color: color,
                  fontWeight: color != Colors.black
                      ? FontWeight.bold
                      : FontWeight.normal),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    handleLocationPermission();
    setDateTime();
    setStatusAbsen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30,bottom: 20,left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Presensi Saya Hari Ini',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
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
                  Expanded(
                    child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Color(0xff8de9d5), Color(0xff32c4c0)],
                          ),
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
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Color(0xff9fccfa), Color(0xff0974f1)],
                          ),
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
                  ),
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
                      style:
                          TextButton.styleFrom(foregroundColor: Colors.white),
                      onPressed: getImage,
                      child: const Text('Absen')))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getGeoLocationPosition() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      await getAddressFromLongLat(position);
    } catch (e) {
      print("Error ambil lokasi: $e");
      setState(() {
        lokasiAbsen = "Gagal mendapatkan lokasi";
      });
    }
  }

  Future<void> getAddressFromLongLat(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    setState(() {
      lokasiAbsen =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      latitude = position.latitude;
      longitude = position.longitude;
      jarakSekarang = Geolocator.distanceBetween(
          latKantor, longKantor, latitude, longitude);
    });
  }

  // untuk menangani permission lokasi
  Future<bool> handleLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.location_off,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              "Location services are disabled. Please enable the services.",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        backgroundColor: Colors.redAccent,
        shape: StadiumBorder(),
        behavior: SnackBarBehavior.floating,
      ));
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Row(
            children: [
              Icon(
                Icons.location_off,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                "Location permissions are denied",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          backgroundColor: Colors.redAccent,
          shape: StadiumBorder(),
          behavior: SnackBarBehavior.floating,
        ));
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.location_off,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              "Location permissions are permanently denied, we cannot request permissions.",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        backgroundColor: Colors.redAccent,
        shape: StadiumBorder(),
        behavior: SnackBarBehavior.floating,
      ));
      return false;
    }
    return true;
  }

  // untuk mengatur format tanggal dan waktu
  void setDateTime() async {
    var dateNow = DateTime.now();
    var dateFormat = DateFormat('dd MMMM yyyy');
    var timeFormat = DateFormat('HH:mm:ss');
    var hourFormat = DateFormat('HH');
    var minuteFormat = DateFormat('mm');

    setState(() {
      tanggalAbsen = dateFormat.format(dateNow);
      waktuAbsen = timeFormat.format(dateNow);
      jamAbsen = int.parse(hourFormat.format(dateNow));
      menitAbsen = int.parse(minuteFormat.format(dateNow));
    });
  }

  // untuk status absen
  void setStatusAbsen() {
    if (jamAbsen < 8 || (jamAbsen == 8 && menitAbsen <= 30)) {
      statusAbsen = "Absen Masuk";
    } else if ((jamAbsen > 8 && jamAbsen < 18) ||
        (jamAbsen == 8 && menitAbsen >= 31)) {
      statusAbsen = "Absen Telat";
    } else {
      statusAbsen = "Absen Keluar";
    }
  }
}
