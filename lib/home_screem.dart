import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController emailContorller= TextEditingController();
  TextEditingController PasswordContorller= TextEditingController();
  void login(String email,password)async{
   try{
     
     var response = await http.post(Uri.parse('https://reqres.in/api/register'),
         body: {
       'email': email,
           'password': password,
         }
     );
     if(response.statusCode==200){
       var data =jsonDecode(response.body.toString());
       print(data['token']);
       print('account created');
     }else{
       print('failed');
     }
   }catch(e){
     print(e.toString());
   }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home Screen'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailContorller,
              decoration: InputDecoration(
                hintText: 'Email'
              ),
            ),
            SizedBox(height: 20),

            TextFormField(
              controller: PasswordContorller,
              decoration: InputDecoration(
                  hintText: 'Password'
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                login(emailContorller.text.toString(),PasswordContorller.text.toString());

              },
              child: Container(
                width: 90,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.rectangle,

                  color: Colors.green,
                ),
                child: Center(
                  child: Text('signup'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
