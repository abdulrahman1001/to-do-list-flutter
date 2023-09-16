// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FacebookApp(),
     
    );
  }
}



class FacebookApp extends StatelessWidget {
  const FacebookApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(      
          "facebook aboodi" ,
           style:  TextStyle(color: Colors.white)         ),
      
        centerTitle: true,
        leading:  IconButton(
          icon: Icon(Icons.menu), 
          
          onPressed: () {  },
          ),

        actions: [
          IconButton(
          icon: Icon(Icons.message), 
          
          onPressed: () {  }
          ),


          IconButton(
          icon: Icon(Icons.search), 
          
          onPressed: () {  },
          ),




        ],


      ),
  
    
      body:Container(height: double.infinity,width: double.infinity,margin: EdgeInsets.all(0),child: Image.network('https://image.tmdb.org/t/p/original/sOLgkBKf1gjMRc4yXxM5aciXdfr.jpg'))
    );
  }
}



