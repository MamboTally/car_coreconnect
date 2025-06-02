import 'package:flutter/material.dart';
import 'package:car_coreconnect/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("CoreConnect Home"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=>Login()));
          },
              icon: Icon(Icons.logout))
        ],
      ),
      body:Center(
       child: Column(
         children: [
           Center(
             child:Text("Welcome",
               style: TextStyle(
                 fontSize:40,
                 fontWeight: FontWeight.bold,
                 color: Colors.blue,
               ),
             )
           )
         ],
       ),
      )
    );
  }
}
