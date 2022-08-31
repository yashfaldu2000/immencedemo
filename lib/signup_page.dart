import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:immencedemo/users.dart';

import 'common_textfeild.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool isBool=true;
  final signupKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      body: getBody(),
    ));
  }
  Widget getBody(){
    return Form(
      key: signupKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/immence.png"),
            SizedBox(height: 30,),
            Text("Create an account",
              style: TextStyle(
                  fontSize: 25
              ),
            ),
            SizedBox(height: 20,),
            Text("Name",
              style: TextStyle(
                  color: Color(0xff0231C8)
              ),
            ),
            SizedBox(height: 5,),
            TextFeild(controller: nameController,title: 'Please enter your email',validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            }),
            SizedBox(height: 10,),

            Text("Email Address",
              style: TextStyle(
                  color: Color(0xff0231C8)
              ),
            ),
            SizedBox(height: 5,),
            TextFeild(controller: emailController,title: 'Please enter your email',validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            }),
            SizedBox(height: 10,)
            ,
            Text("Phone",
              style: TextStyle(
                  color: Color(0xff0231C8)
              ),
            ),
            SizedBox(height: 5,),
            TextFeild(controller: phoneController,title: 'Please enter your email',validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            }),
            SizedBox(height: 10,),
            Text("Password",
              style: TextStyle(
                  color: Color(0xff0231C8)
              ),
            ),
            SizedBox(height: 5,),
            TextFeild(controller: passwordController,title: 'Please enter your email',validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            }),

            SizedBox(height: 10,),
            Row(
              children: [
                Checkbox(value: isBool,
                    checkColor: Colors.white,
                    onChanged: (value){
                      setState((){
                        isBool = value!;
                      });
                    }),
                Text('Remember Me',style: TextStyle(color: Colors.black),)
              ],
            ),
            SizedBox(height: 5,),
            InkWell(
              onTap:()async{
                print('hi');
                if (signupKey.currentState!.validate()) {
                  try{
                    final newUser=await auth.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
                    print('yes');
                    if(newUser!=null){
                      Navigator.push(context,MaterialPageRoute(builder: (context) =>  Users()),
                      );
                    }
                  }
                  on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password')
                    {
                    print('weakPassword');

                    }
                    else if (e.code == 'email-already-in-use')
                    {
                      print('email already in use');

                    }
                  } catch (e) {
                    print(e);
                  }
                }
              },
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xff0231C8),
                    borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Text('SignUp',style: TextStyle(color: Colors.white),),
              ),
            ),
            Spacer(),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 RichText(
                  text: TextSpan(
                    children:[
                      TextSpan(text: "Already have an account ? ",style: TextStyle(color: Colors.black)),
                      TextSpan(text:"Login",style: TextStyle(color: Color(0xff0231C8))),
                    ],
                  ),
            ),
               ],
             ),







          ],
        ),
      ),
    );
  }
}
