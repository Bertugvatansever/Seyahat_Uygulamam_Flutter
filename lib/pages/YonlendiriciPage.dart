import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // Cupertino eklemeyi unutmayın
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seyahat_uygulamam/pages/BucketPage.dart';
import 'package:seyahat_uygulamam/pages/Haritapage.dart';
import 'package:seyahat_uygulamam/pages/SeyahatPage.dart';

class YonlendiriciPage extends StatefulWidget {
  const YonlendiriciPage({super.key, required});

  @override
  State<YonlendiriciPage> createState() => _YonlendiriciPageState();
}

class _YonlendiriciPageState extends State<YonlendiriciPage> {
  int _mevcutindex = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold( // CupertinoTabScaffold kullanıyoruz
      tabBar: CupertinoTabBar(
        backgroundColor: CupertinoColors.white,
        activeColor: Colors.tealAccent[700],       
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.house_fill,
              size: 30.0,
            ),
            label: "AnaSayfa",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.location_fill,
              size: 30.0,
            ),
            label: "Harita",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.airplane,
              size: 30.0,
            ),
            label: "Bucket",
          ),
        ],
        currentIndex: _mevcutindex,
        onTap: (index) {
          setState(() {
            _mevcutindex = index;
          });
        },
      ),
       tabBuilder: (context , index) {
          switch (index) {
            case 0:
              return CupertinoTabView(builder:  (context) {
                return CupertinoPageScaffold(child: SeyahatPage(),);
              });
            case 1:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(child:HaritaPage(latLng: LatLng(39.7654458, 30.4624142)));
              });
            case 2:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(child:BucketPage());
              });
            default:
              return SeyahatPage();
          }
          }
    );
  }

  // Widget CallPage(int mevcutindex) {
  //   switch (mevcutindex) {
  //     case 0:
  //       return SeyahatPage();
  //     case 1:
  //       return HaritaPage(latLng: LatLng(39.7654458, 30.4624142));
  //     case 2:
  //       return BucketPage();
  //     default:
  //     return Container(); // Veya herhangi başka bir varsayılan widget
  //   }
  //}
}