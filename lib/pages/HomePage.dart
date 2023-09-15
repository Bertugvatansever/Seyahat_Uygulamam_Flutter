import 'package:flutter/material.dart';
import 'YonlendiriciPage.dart'; // YonlendiriciPage sayfasının import edildiğinden emin olun

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenWidth = screenSize.width;
    double screenHeight = screenSize.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              "images/intropic.jpg",
              fit: BoxFit.cover,
              width: screenWidth,
              height: screenHeight,
            ),
            Positioned(
              top: screenHeight * 0.25,
              child: Text(
                "Seyahat Uygulaması",
                style: TextStyle(
                  fontFamily: 'Schyler',
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.35,
              child: Text(
                "Early Access",
                style: TextStyle(
                  fontFamily: 'Custom Font',
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.86,
              child: BaslayalimButonu(context),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton BaslayalimButonu(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => YonlendiriciPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 45, vertical: 17),
        backgroundColor: Colors.white,
        foregroundColor: Colors.blueGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        "Hadi Başlayalım",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "Custom Font",
          fontSize: 18,
        ),
      ),
    );
  }
}
