import 'package:flutter/material.dart';

class AramaSayfasi extends StatelessWidget {
   final List<String> Konumlar = [
    "London",
    "Paris",
    "Madrid",
    "London",
    "Paris",
    "Madrid",
    "London",
    "Paris",
    "Madrid",
    // Diğer fotoğraf yollarını buraya ekleyin
  ];
  final List<String> cities = [
    "London",
    "Paris",
    "Madrid",
    "London",
    "Paris",
    "Madrid",
    "London",
    "Paris",
    "Madrid",
    // Diğer şehir bilgilerini buraya ekleyin
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left:8,top: 50),
            child: Text(
                "Search Page",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ),
          SizedBox(height: 50),
          Row(
            children: [
            Padding(
              padding:  EdgeInsets.only(left:12),
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                }, 
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.tealAccent[700],
                  )
                ),
            ),
            Container(
              width: 300,
              child:      
                     TextFormField(
                        decoration: InputDecoration(
                          hintText: "Nereye Gitmek İstersin ?",
                          fillColor: Colors.grey[100],
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.tealAccent[700],
                            )
                        ),
                  ),                                                                   
            ),     
        ],
      ),
      Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
              itemCount: Konumlar.length, // Listenin eleman sayısı, isteğe bağlı olarak değiştirilebilir
              itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.only(left:27,right: 25),
                child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                leading: Icon(
                        Icons.location_on,
                        size: 30,
                        ),
                title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Yer adı ${Konumlar[index]}', style: TextStyle(fontSize: 16)),
                          Text('Yer açıklaması ${cities[index]}'),
                        ],
                ),
                trailing: Container(
                        width: 40,
                        height: 40,
                        color: Colors.tealAccent[700] ,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          ),
                ),                      
                onTap: () {
                },
                          ),
              );
          },
        ),    
      )
      
        ]
    ),

    );
   
  }
}

