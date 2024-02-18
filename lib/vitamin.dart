import 'package:flutter/material.dart';
import 'package:smartaca_alpha_6/waterdischarge.dart';

class Vitamin extends StatefulWidget {
  const Vitamin({super.key});

  @override
  State<Vitamin> createState() => _VitaminState();
}

class _VitaminState extends State<Vitamin> {
  bool waterPower = false;
  int currentPage = 0;

  void navigateToWaterDischarge() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WaterDischarge()),
    );
  }

  void navigateToVitamin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Vitamin()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Water System'),
      //   automaticallyImplyLeading: false,
      //   leading: IconButton(
      //     onPressed: () {
      //       // Navigator.of(context).pop();
      //     },
      //     icon: const Icon(Icons.arrow_back_ios),
      //   ),
      //   centerTitle: true,
      //   actions: <Widget>[
      //     IconButton(
      //       onPressed: () {
      //         // Tambahkan logika aksi untuk ikon akun di sini
      //       },
      //       icon: const Icon(Icons.settings),
      //     ),
      //   ],
      // ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(top: 75.0),
              child: Image.asset(
                waterPower
                    ? 'images/Vitamin_Circle_On.png'
                    : 'images/Vitamin_Circle_Off.png',
              ),
            ),
          ),
          const SizedBox(height: 15.0), // Jarak antara gambar dan teks
          const Text.rich(
            TextSpan(
              text: '70%',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 30.0),
            margin: EdgeInsets.fromLTRB(40.0, 70.0, 40.0, 40.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Center(
                      child: Text.rich(
                        TextSpan(
                          text: 'Power',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Switch(
                      value: waterPower,
                      onChanged: (value) {
                        setState(() {
                          waterPower = value;
                        });
                      },
                    ),
                  ],
                ),
                Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.g_mobiledata_rounded,
                        color: waterPower ? Colors.green : Colors.red,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        waterPower ? 'Nyala' : 'Mati',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.water_drop_rounded,
                        color: Colors.green), //Icon_Air_1
                    Icon(Icons.water_drop_rounded,
                        color: Colors.black26), //icon_Air_2
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: NavigationBar(
      //   destinations: const [
      //     NavigationDestination(
      //         icon: Icon(Icons.thermostat), label: 'Temperature'),
      //     NavigationDestination(
      //         icon: Icon(Icons.water_drop_rounded), label: 'Water Discharge'),
      //     NavigationDestination(
      //         icon: Icon(Icons.account_circle_rounded), label: 'Account'),
      //   ],
      //   onDestinationSelected: (int index) {
      //     setState(() {
      //       currentPage = index;
      //     });
      //   },
      //   selectedIndex: currentPage,
      // ),
    );
  }
}
