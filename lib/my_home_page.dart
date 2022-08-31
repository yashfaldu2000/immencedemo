import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:immencedemo/common_textfeild.dart';
import 'package:immencedemo/signup_page.dart';
import 'package:immencedemo/users.dart';
class MyhomePage extends StatefulWidget {
  const MyhomePage({Key? key}) : super(key: key);

  @override
  State<MyhomePage> createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  final auth=FirebaseAuth.instance;
  final loginKey = GlobalKey<FormState>();
  bool isBool=true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: getbody(),
        ));
  }
  Widget getbody(){
    return Form(
      key:loginKey ,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Image.asset("assets/immence.png"),
              SizedBox(height: 30,),
              Text("Hi, Wecome Back! 👋"),
            SizedBox(height: 20,),
              Text("Email",style: TextStyle(color: Color(0xff0231C8)),),
            SizedBox(height: 5,),
              TextFeild(controller: emailController,validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },title: 'Please enter your email',keyboardType: TextInputType.emailAddress,),
            SizedBox(height: 10,),
            Text("Password",style: TextStyle(color: Color(0xff0231C8)),),
            SizedBox(height: 5,),
            TextFeild(controller: passwordController,title: 'Please enter your email',validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            }),
            SizedBox(height: 15,),
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
                if (loginKey.currentState!.validate()) {
                  try{
                    final user=await auth.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
                    if(user!=null){

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Users()),
                      );
                    }
                  }
                  on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found')
                    {
                           print('user-not-found');
                    }
                    else if (e.code == 'wrong-password')
                    {
                      print('wrong-password');
                    }

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
                child: Text('Login',style: TextStyle(color: Colors.white),),
              ),
            ),
            SizedBox(height: 5,),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  SignupPage()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      children:[
                        TextSpan(text: "Don't have an account ? ",style: TextStyle(color: Colors.black)),
                        TextSpan(text:"Sign Up",style: TextStyle(color: Color(0xff0231C8))),
                      ],
                    ),
                  ),
                ),
              ],
            )


          ],
        ),
      ),
    );
  }

}
