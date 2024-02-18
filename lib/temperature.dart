import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Temperature extends StatefulWidget {
  const Temperature({Key? key}) : super(key: key);

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {
  FirebaseDatabase database = FirebaseDatabase.instance;

  bool peltierPower = false;
  int currentPage = 0;

  String temperature = 'Loading...';

  @override
  void initState() {
    super.initState();
    // ignore: deprecated_member_use
    final temperatureRef = database.reference().child('Device1/Temp');
    temperatureRef.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          temperature = event.snapshot.value.toString();
          debugPrint("Temp: $temperature");
        });
      } else {
        if (kDebugMode) {
          print('No Data Available.');
        }
      }
    });

    final peltierPowerRef = database.reference().child('Device1/Peltier');
    peltierPowerRef.onValue.listen((event) {
      if (event.snapshot.exists) {
        setState(() {
          peltierPower = event.snapshot.value as bool;
        });
      } else {
        if (kDebugMode) {
          print('No Data Available.');
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    // Hentikan event listener
    // database.reference().child('Device1/Temp').onValue.drain();
    // database.reference().child('Device1/Peltier').onValue.drain();
  }

  // void initState() {
  //   super.initState();
  //   _temperatureRef.onValue.listen((event) {
  //     final data = event.snapshot.value as String?;
  //     if (data != null) {
  //       setState(() {
  //         temperature = data;
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.only(top: 75.0),
              child: Image.asset(
                peltierPower
                    ? 'images/Fan_Circle_On.png'
                    : 'images/Fan_Circle_Off.png',
              ),
            ),
          ),
          const SizedBox(height: 15.0), // Jarak antara gambar dan teks

          Text(
            temperature,
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
                      value: peltierPower,
                      onChanged: (value) {
                        setState(() {
                          peltierPower = value;
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
                        color: peltierPower ? Colors.green : Colors.red,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        peltierPower ? 'Nyala' : 'Mati',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Center(
          //   child: Container(
          //     child: const Center(
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Icon(Icons.water_drop_rounded, color: Colors.green),
          //           Icon(Icons.water_drop_rounded, color: Colors.black26),
          //         ],
          //       ),
          //     ),
          //   ),
          // )
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
