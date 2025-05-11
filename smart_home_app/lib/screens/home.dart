import 'package:flutter/material.dart';
import 'package:smart_home_app/widgets/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 40;

  // list of Smart Devices
  List mySmartDevices = [
    // deviceName, iconPath, powerStatus
    ["Smart Light", "lib/icons/light.png", true],
    ["Smart Fan", "lib/icons/fan.png", true],
    ["Smart AC", "lib/icons/ac.png", true],
    ["Smart TV", "lib/icons/tv.png", true],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // menu icon
                  Image.asset(
                    'lib/icons/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),

                  // accounts icon
                  Icon(Icons.person, size: 45, color: Colors.grey[800]),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: verticalPadding,
                vertical: verticalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Welcome Home,"),
                  Text("AETHER HOME", style: TextStyle(fontSize: 40)),
                ],
              ),
            ),

            // smart devices + grid
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: verticalPadding,
                vertical: verticalPadding,
              ),
              child: Text("Smart Devices"),
            ),

            Expanded(
              child: GridView.builder(
                itemCount: mySmartDevices.length,
                padding: const EdgeInsets.all(25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
