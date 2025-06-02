import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:car_coreconnect/login.dart';

void main(List<String> args) {
  runApp (Signup());
}

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final usernamec =TextEditingController();
  final passc =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("CoreConnect"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(40.0),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  Text(
                    "Signup",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      //color: Color.blue,
                    ),
                  ),
                  SizedBox(height:30),
                  TextField(
                    controller: usernamec,
                    decoration: InputDecoration(
                      label: Text("Username"),
                      hintText: "Enter username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(height:20),
                  TextField(
                    decoration: InputDecoration(
                      label: Text("Full_name"),
                      hintText: "Enter Full_name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),SizedBox(height:20),
                  TextField(
                    decoration: InputDecoration(
                      label: Text("ID_num"),
                      hintText: "Enter ID number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(height:20),
                  TextField(
                    controller: passc,
                    obscureText:true,
                    decoration: InputDecoration(
                      label: Text("Password"),
                      hintText: "Enter password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(height:20),
                  ElevatedButton(onPressed: ()async{
                    //Signup Button
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: usernamec.text.trim(),
                        password: passc.text.trim()
                    );

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context)=>Login()));

                  }, child:Text
                    ("Signup"))
                ],
              )
          )
      ),
    );
  }
}
