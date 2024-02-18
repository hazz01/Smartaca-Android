import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profil'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 30.0,
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigator.push(
              // context,
              // MaterialPageRoute(
              //   builder: (context) => const setting(),
              // ),
              // );
            },
          ),
        ],
      ),
      body: const Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 40.0,
              left: 25.0,
              child: Icon(Icons.account_circle_rounded,
                  size: 90.0, color: Colors.green),
            ),
            Positioned(
              top: 59.0,
              left: 130.0,
              child: Text(
                'Pak Ryo Hariyono',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              top: 83.0,
              left: 130.0,
              child: Text(
                '+628794766790',
                style: TextStyle(
                  color: Colors.black26,
                ),
              ),
            ),
            Positioned(
              top: 68.0,
              right: 30.0,
              child: Icon(
                Icons.edit_outlined,
                size: 25.0,
                color: Colors.black26,
              ),
            ),
            Positioned(
              top: 155,
              left: 23,
              child: Text(
                'Setelan',
                style: TextStyle(
                  fontSize: 25,
                  letterSpacing: 2,
                ),
              ),
            ),
            Positioned(
              top: 205,
              left: 30,
              child: Icon(
                Icons.public,
                color: Colors.black26,
              ),
            ),
            Positioned(
              top: 260,
              left: 28,
              child: Icon(
                Icons.lock_outline_rounded,
                color: Colors.black26,
                size: 26,
              ),
            ),
            Positioned(
              top: 210,
              left: 130,
              child: Text(
                'Pilih Bahasa                                           >',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black26,
                    decoration: TextDecoration.underline),
              ),
            ),
            Positioned(
              top: 268,
              left: 130,
              child: Text(
                'Ganti Password                                     >',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black26,
                    decoration: TextDecoration.underline),
              ),
            ),
            Positioned(
              top: 360,
              left: 160,
              child: Text(
                'Keluar',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
