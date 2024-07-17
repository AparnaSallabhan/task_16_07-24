// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task_16_07/view/home_screen/home_screen.dart';
import 'package:task_16_07/view/registration_screen/registration_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.email, required this.password});

  final String email ;
  final String password;
  @override
  Widget build(BuildContext context) {

 final logEmailFormkey = GlobalKey<FormState>();
 final logPassFormKey = GlobalKey<FormState>();

 final logEmailController = TextEditingController();
 final logPassController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        
            SizedBox(height:70 ,),
        
            Center(child: Text("Sign in to your Account", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
        
            SizedBox(height: 30,),

            Form(
              key: logEmailFormkey,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Your Email Address",
                  border: OutlineInputBorder()
                ),
                controller: logEmailController,

                validator: (value) {
                  if(value == null||value.isEmpty ){
                    return "Enter Email address";
                  }
                  else if(value!=email){
                     return "Invalid Email address";
                  }
                  else{
                   return null;
                  }
                },
               ),
            ),

              SizedBox(height: 30,),

            Form(
              key: logPassFormKey,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Your Password",
                  suffixIcon: Icon(Icons.visibility_off, color: Colors.grey,),
                  border: OutlineInputBorder()
                ),
                controller: logPassController,

                validator: (value) {
                  if(value==null||value.isEmpty){
                    return "Enter email";
                  }
                  else if(value!= password){
                    return "Invalid Password";
                  }
                  else{
                    return null;
                  }
                },
               ),
            ),
             SizedBox(height: 30,),

             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("✅ Remember Me"),
                Text("Forgott Password",style: TextStyle(color: Colors.blue[800]),)

              ],
             ),

             SizedBox(height: 30,),


            
            InkWell(
              onTap: () {
                if(logEmailFormkey.currentState!.validate()&&
                logPassFormKey.currentState!.validate()
                ){
                  if(
                    email==logEmailController.text&&
                    password == logPassController.text
                  ){
               Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen(),) );
                  }
                
                }
                
                  
              },
              child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(child: Text("Sign in",style:TextStyle(color: Colors.white, ), )),
                  decoration: BoxDecoration(
                    color:  Colors.blue[900],
                    borderRadius: BorderRadius.circular(5)
                  ),
                ),
            ),

             //SizedBox(height: 150,),
             Spacer(),

             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen(),));
                }, child: Text("Sign Up", style: TextStyle(color: Colors.blue[800]),))
              ],
             ),
             SizedBox(
              height: 50,
             )

          ],
        ),
      ),
    );
  }
}