// ignore_for_file: file_names, prefer_const_constructors, unnecessary_new
import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget{
  const MainMenu({Key? key}) : super(key: key);

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Main Menu"),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Text("Kategori Latihan Bahasa", 
                  style: TextStyle(
                      fontSize: 30, 
                      fontWeight: FontWeight.bold, 
                    ),
                  ),
              Padding(padding: EdgeInsets.only(top: 60.0)),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/pilgan');
                },
                child: Text("Pilihan Ganda",
                style: TextStyle(
                      fontSize: 24, 
                      color: Colors.black,
                    ),
                  ),
                style: ElevatedButton.styleFrom(
                fixedSize: const Size(350, 50), 
                primary: Colors.red),
                ),
              Padding(padding: EdgeInsets.only(top: 40.0)),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/cocokata');
                }, 
                child: Text("Cocok Kata",
                style: TextStyle(
                      fontSize: 24, 
                      color: Colors.black,
                    ),
                  ),
                style: ElevatedButton.styleFrom(
                fixedSize: const Size(350, 50), 
                primary: Colors.red),
                ),
                Padding(padding: EdgeInsets.only(top: 40.0)),
                ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/tebakgbr');
                }, 
                child: Text("Tebak Gambar",
                style: TextStyle(
                      fontSize: 24, 
                      color: Colors.black,
                    ),
                  ),
                style: ElevatedButton.styleFrom(
                fixedSize: const Size(350, 50), 
                primary: Colors.red),
                ),
                Padding(padding: EdgeInsets.only(top: 40.0)),
                ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/terjemhn');
                }, 
                child: Text("Terjemahan",
                style: TextStyle(
                      fontSize: 24, 
                      color: Colors.black,
                    ),
                  ),
                style: ElevatedButton.styleFrom(
                fixedSize: const Size(350, 50), 
                primary: Colors.red),
                ) 
            ],
          ),
        ),
        ),
        theme: new ThemeData(scaffoldBackgroundColor: Colors.grey[700]),
    );
  }
}