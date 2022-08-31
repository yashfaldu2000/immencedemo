import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(20),
                child:Column(
                  children: [
                    Container(
                     padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: Image.asset('assets/Subtract.png'),
                    ),
                    SizedBox(height: 20,),
                    Text("John Doe",style: TextStyle(
                      fontSize: 35,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Email",style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),),
                        Text("johndoe@gmail.com",style: TextStyle(
                            fontSize: 23,
                            color: Colors.black
                        ),),
                      ],
                    ),
                    SizedBox(height: 7,),
                    Divider(color: Colors.grey.withOpacity(0.6),),
                    SizedBox(height: 7,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Phone no",style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),),
                        Text("+02 0344060503",style: TextStyle(
                            fontSize: 23,
                            color: Colors.black
                        ),),
                      ],
                    ),
                    SizedBox(height: 7,),
                    Divider(color: Colors.grey.withOpacity(0.6),),
                    SizedBox(height: 7,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Logout",style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),),
                        Icon(Icons.logout)
                      ],
                    ),
                    SizedBox(height: 7,),
                 Divider(color: Colors.grey.withOpacity(0.6),)
                  ],
                ))));
  }
}
