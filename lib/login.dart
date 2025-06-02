import 'package:car_coreconnect/signup.dart';
import 'package:car_coreconnect/map_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:car_coreconnect/home.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'map_page.dart';

final _formKey = GlobalKey<FormState>();
void main(List<String> args) {
  runApp (Login());
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernamec =TextEditingController();
  final passc =TextEditingController();

  /*String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r'^[\w\,-]+@[\w-]+\.\w{2,3}(\. \w{2,3})?$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (isEmailValid) {
      return 'Please enter a valid email';
    }
    return null;
  }*/

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
              child:Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 95.0,
                        fontWeight: FontWeight.bold,
                        //color: Color.blue,
                      ),
                    ),
                    SizedBox(height:80),
                    TextFormField(
                      controller: usernamec,
                      decoration: InputDecoration(
                        label: Text("Username"),
                        hintText: "Enter username",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      validator: (email) =>AutofillHints.email.length <6 ? "Email must contain @ and must have hostname": null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height:30),
                    TextFormField(
                      controller: passc,
                      obscureText:true,
                      decoration: InputDecoration(
                        label: Text("Password"),
                        hintText: "Enter password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      validator: (name) =>name!.length <6 ? "Password should be at least 6 characters": null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    SizedBox(height:70),
                    ElevatedButton(
                        onPressed: ()async{
                      //Login Button
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: usernamec.text.trim(),
                          password: passc.text.trim(),
                      );
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context)=>MapPage()));
                    },
                        child:Text
                      ("Login"
                    )
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget> [
                        Text("Do you have an account ?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        SizedBox(width: 5.0),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context)=>Signup()));
                          },
                          child: Text('Register',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),),

                        )
                      ],
                    ),

                  ],
                ),
              ),
          )
      ),
    );
  }
}
