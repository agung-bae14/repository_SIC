import 'package:flutter/material.dart';

class CardUser extends StatelessWidget {
  final String namaKaryawan;
  final String jabatan;
  final String kategori;
  final String nip;

  const CardUser(
      {super.key,
      required this.namaKaryawan,
      required this.jabatan,
      required this.kategori,
      required this.nip});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      child: Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('images/background-card.jpg'),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(namaKaryawan,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Column(
                    children: [
                      Text(jabatan,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70)),
                      Text(kategori,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70)),
                    ],
                  ),
                  Text(nip,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ))),
    );
  }
}
