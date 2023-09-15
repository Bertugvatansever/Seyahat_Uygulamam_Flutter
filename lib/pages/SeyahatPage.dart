import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seyahat_uygulamam/pages/Aramasayfasipage.dart';
import 'package:seyahat_uygulamam/pages/YonlendiriciPage.dart';
import 'package:seyahat_uygulamam/pages/Haritapage.dart';

class SeyahatPage extends StatelessWidget {
  final List<String> imagePaths = [
    "images/Ankara.jpg",
    "images/Eskisehir.jpg",
    "images/istanbul.jpg",
    "images/Mugla.jpg",
    "images/Bursa.jpg"
    // Diğer fotoğraf yollarını buraya ekleyin
  ];
  final List<Map<String,LatLng>> cities = [
    {"Ankara": LatLng(39.9334,32.8597),},
    {"Eskişehir": LatLng(39.7667,30.5256),},
    {"İstanbul": LatLng(41.0082,28.9784),},
    {"Muğla": LatLng(37.2130,28.3636),},
    {"Bursa": LatLng(40.1885,29.0610),},


    // Diğer şehir bilgilerini buraya ekleyin
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.tealAccent[700],
          ),
          padding: EdgeInsets.only(left: 20, top: 100),
          height: 320,
          width: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Find Your next \nADVENTURE",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 350,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                          onTap: (){
                             Navigator.of(context,rootNavigator: true).push(
                                
                                MaterialPageRoute(builder: (context) => AramaSayfasi()),
                                    );
                          },                          
                          decoration: InputDecoration(
                            hintText: "Nereye Gitmek İstersin ?",
                            border: InputBorder.none,
                          ),
                        ),                    
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.tealAccent[700],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 8,bottom: 15),
          child: Text(
            "Popüler Yerler",
            style: TextStyle(
              fontFamily: "Overpass",
              fontSize: 25,
              letterSpacing: 0.5
            ),
          ),
        ),
        SizedBox(height: 10,),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 8),              
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal, // Yatayda sıralamak için scrollDirection özelliği
                    itemCount: imagePaths.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          // _showAlertDialog(context, imagePaths[index],cities[index].keys.first);
                        }, 
                      child :SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: (){
Navigator.push((context), MaterialPageRoute(builder: (context)=>HaritaPage(latLng: cities[index].values.first  )));
                            },
                            child: Column(
                              children: [
                                ClipRRect
                              (
                            
                                borderRadius: BorderRadius.circular(20.0),
                                  child: Image.asset(
                                    imagePaths[index],
                                    fit: BoxFit.cover,
                                    width: 200,
                                    height: 200,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding:  EdgeInsets.only(right: 140),
                                  child: Text(
                                    cities[index].keys.first,
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding: EdgeInsets.only(right: 140),
                                  child: Text(
                                    "Türkiye",
                                    style: TextStyle(fontSize: 18,),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      );
                    },
                  ),
          
          
          
          ),
        ),
        
      ],
    ),
    );
     
  }
}
 void _showAlertDialog(BuildContext context, String cityphoto,String cityName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
             mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 370,
                height: 300,
                child: Image.asset(
                  cityphoto,
                  fit: BoxFit.cover,
                  )
                ),
                SizedBox(height: 10,),
                Text(
                  cityName,
                  style: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                SizedBox(height: 15,),
                SizedBox(
                  width: 350,
                  height: 40,
                  child: ElevatedButton(
                              onPressed: () {
                  Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.tealAccent[700],
                                foregroundColor: Colors.white,              
                              ),
                              child: Text('+ Add to Bucket List',style: TextStyle(fontSize: 20),),
                  ),
                )
            ],
          )
          
        );
      },
    );
  }