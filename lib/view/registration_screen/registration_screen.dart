// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task_16_07/view/login_screen/login_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});



  @override
  Widget build(BuildContext context) {
   

    final emailFormKey = GlobalKey<FormState>();
    final passWordFormKey = GlobalKey<FormState>();
    final confirmPassFormKey = GlobalKey<FormState>();

    final emailController = TextEditingController();
    final passWordController = TextEditingController();
    final confirmPasscontroller = TextEditingController();


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
        
        
            SizedBox(height:70 ,),
        
            Center(child: Text("Sign Up for Free", style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
            
             SizedBox(height: 30,),
        
              Form(
                key: emailFormKey,

                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Your Email Address",
                    border: OutlineInputBorder()
                  ),
                
                  validator: (value) {
                    if(value== null || value.isEmpty ){
                      return "Enter an Email";
                    }
                    else if(!value.contains('@')){
                      return "Your email must contain @";
                    }
                    else{
                      return null;
                    }
                  },
                
                
                  controller:emailController ,
                
                
                 ),
              ),
        
                SizedBox(height: 30,),
        
              Form(

                key: passWordFormKey,

                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Your Password",
                    suffixIcon: Icon(Icons.visibility_off),
                    border: OutlineInputBorder()
                  ),

                  validator: (value) {
                    if(value==null||value.isEmpty){
                      return "Enter Password";
                    }
                    else if (value.length<7){
                      return "password must contain 7 charecters";
                    }
                    else{
                      return null;
                    }
                  },
                
                  controller: passWordController,
                
                 ),
              ),
        
                SizedBox(height: 30,),
        
              Form(

                key: confirmPassFormKey,

                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Your Confirm Password",
                    suffixIcon: Icon(Icons.visibility_off),
                    border: OutlineInputBorder()
                  ),

                  validator: (value) {
                    if(value==null||value.isEmpty){
                      return "Re enter password";
                    }

                    else if(value!= passWordController.text){
                      return "password is not correct";
                    }
                    else {
                      return null;
                    }
                  },
                
                  controller: confirmPasscontroller,
                
                 ),
              ),

                // SizedBox(height: 30,),
                Spacer(),

           
              InkWell(
                onTap: () {
                  if(
                    emailFormKey.currentState!.validate()&&
                    passWordFormKey.currentState!.validate()&&
                    confirmPassFormKey.currentState!.validate()
                  ){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(email: emailController.text,password: confirmPasscontroller.text,),));
                  }
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(child: Text("Sign Up",style:TextStyle(color: Colors.white, ), )),
                  decoration: BoxDecoration(
                    color:  Colors.blue[900],
                    borderRadius: BorderRadius.circular(5)
                  ),
                ),
              ),

              

              SizedBox(height: 150,),

             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationScreen(),));
                }, child: Text("Sign in", style: TextStyle(color: Colors.blue[800]),))
              ],
             ),
             SizedBox(
              //height: 50,
             )



          ],
        ),
      ),
    );
  }
}