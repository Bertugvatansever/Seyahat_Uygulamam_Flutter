import 'package:flutter/material.dart';

class BucketPage extends StatelessWidget {
  const BucketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 110,),
            Text(
              "BUCKET  LIST ",
              style: TextStyle(
                fontFamily: "ReemKufi",
                fontSize: 40,
                color: Colors.tealAccent[700],     
              ),
            ),
            Text(
              "Your bucket list organized countrywise",
              style: TextStyle(
                fontFamily: "OpenSans",
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 70),
            Container(
              width: 500,
              height: 300,
              child: Image.asset(
                "images/Bucketfotosu.avif",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "Empty bucket list. Add some places to begin your adventure", 
              style: TextStyle(
                fontFamily: "Opensans",
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
              )
          ],
        ),
      ),
    );
  }
}