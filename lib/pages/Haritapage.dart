import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class HaritaPage extends StatefulWidget {
  const HaritaPage({super.key, required this.latLng});

  final LatLng latLng;

  @override
  State<HaritaPage> createState() => _HaritaPageState();
}

class _HaritaPageState extends State<HaritaPage> {
  String mapTheme = "";
  GoogleMapController? _mapController;
  CameraPosition? _city;
  bool _darkMode = false;

  @override
  void initState() {
    super.initState();
    _city = CameraPosition(
        bearing: 192.8334901395799,
        target: widget.latLng,
        tilt: 59.440717697143555,
        zoom: 10.151926040649414);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Harita Sayfasi"),
        ),
        backgroundColor: Colors.tealAccent[700],
      ),
      body:Container(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(39.7654458, 30.4624142),
                zoom: 10.0,
              ),
              onMapCreated: (controller) async {
                await controller.animateCamera(CameraUpdate.newCameraPosition(_city!));
                setState(() {
                  _mapController = controller;
                });
                if (_darkMode) {
                  // Koyu tema stilini uygula
                  print(_darkMode);
                  String darkStyle = await DefaultAssetBundle.of(context).loadString("assets/dark_theme.json");
                  controller.setMapStyle(darkStyle);
                } else {
                  print(_darkMode);
                  // Açık tema stilini uygula
                  String lightStyle = await DefaultAssetBundle.of(context).loadString("assets/light_theme.json");
                  controller.setMapStyle(lightStyle);
                }              
              },
            ),
            Gece_gunduz_buton_islemleri(screenHeight, screenWidth, context),
          ],
        )
      ),
      );
  }

  Positioned Gece_gunduz_buton_islemleri(double screenHeight, double screenWidth, BuildContext context) {
    return Positioned(
            top: screenHeight*0.25,
            left: screenWidth*0.85,
            child: RotatedBox(
              quarterTurns: 3,
              child: LiteRollingSwitch(
              width : 150,
              value: _darkMode,
              textOn: 'DARK',
              textOff: 'LIGHT',
              onChanged: (bool value) async {
                if (value == true){
                     String darkStyle = await DefaultAssetBundle.of(context).loadString("assets/dark_theme.json");
                     _mapController?.setMapStyle(darkStyle);
                  }
                else {
                  String lightStyle = await DefaultAssetBundle.of(context).loadString("assets/light_theme.json");
                  _mapController?.setMapStyle(lightStyle);
                }
                setState(() {
                  _darkMode = value;
                  print(_darkMode);          
                });
              },
              colorOn: Colors.blueGrey,
              colorOff: Colors.yellow,
              iconOn: FontAwesomeIcons.solidMoon,
              iconOff: FontAwesomeIcons.solidSun,
              textSize: 22.0, textOnColor: Colors.white, onTap: (){}, onDoubleTap: (){}, onSwipe: (){},
                      ),
            ),
          );
  }
}
