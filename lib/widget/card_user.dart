import 'package:flutter/material.dart';

class CardUser extends StatefulWidget {
  const CardUser({super.key});

  @override
  State<CardUser> createState() => _CardUserState();
}

class _CardUserState extends State<CardUser> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      child: Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/background-card.jpg'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Nama Karyawan',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  Text('Jabatan',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70)),
                  Text('NIP',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ))),
    );
  }
}
