import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smartaca_alpha_6/vitamin.dart';
import 'package:firebase_database/firebase_database.dart';

class WaterDischarge extends StatefulWidget {
  const WaterDischarge({super.key});

  @override
  State<WaterDischarge> createState() => _WaterDischargeState();
}

class _WaterDischargeState extends State<WaterDischarge> {
  FirebaseDatabase database = FirebaseDatabase.instance;

  bool pumpPower = false;
  int currentPage = 0;

  String humid = 'Loading...';

  @override
  void initState() {
    super.initState();
    // Gunakan event listener untuk memperbarui suhu secara real-time
    // ignore: deprecated_member_use
    final humidRef = database.reference().child('Device1/Humid');
    humidRef.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          humid = event.snapshot.value.toString();
        });
      } else {
        if (kDebugMode) {
          print('No Data Available.');
        }
      }
    });

    final pumpPowerRef = database.reference().child('Device1/Pump');
    pumpPowerRef.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          pumpPower = event.snapshot.value as bool;
          debugPrint("Pump Power: $pumpPower");
        });
      } else {
        if (kDebugMode) {
          print('No Data Available.');
        }
      }
    });
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
                pumpPower
                    ? 'images/Water_Circle_On.png'
                    : 'images/Water_Circle_Off.png',
              ),
            ),
          ),
          const SizedBox(height: 15.0), // Jarak antara gambar dan teks
          Text(
            humid,
            style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 30.0),
            margin: const EdgeInsets.fromLTRB(40.0, 70.0, 40.0, 40.0),
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
                      value: pumpPower,
                      onChanged: (value) {
                        setState(() {
                          pumpPower = value;
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
                        color: pumpPower ? Colors.green : Colors.red,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        pumpPower ? 'Nyala' : 'Mati',
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
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          // Navigasi ke halaman WaterDischarge
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => WaterDischarge(),
                          //   ),
                          // );

                          // Atur currentPage menjadi 1 ketika Icons.water_drop_rounded, color: Colors.green diklik
                          currentPage = 1;
                        });
                      },
                      child: const Icon(
                        Icons.water_drop_rounded,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    InkWell(
                      onTap: () {
                        setState(() {
                          // Navigasi ke halaman Vitamin
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Vitamin(),
                          //   ),
                          // );

                          // Atur currentPage menjadi 2 ketika Icons.water_drop_rounded, color: Colors.black26 diklik
                          currentPage = 0;
                        });
                      },
                      child: const Icon(
                        Icons.water_drop_rounded,
                        color: Colors.black26,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
