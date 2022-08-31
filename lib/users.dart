import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                padding: EdgeInsets.all(20),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/immence.png"),
                    SizedBox(height: 30,),
                    Text("Users",style: TextStyle(
                        fontSize: 30
                    ),),
                    SizedBox(height: 10,),
              Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return  getCard();
                    }),
              ),

                  ],
                ))));
  }
  Widget getCard(){
    return Card(
      child: ListTile(
        leading: FlutterLogo(size: 72.0),
        title: Text('John Smith'),
        subtitle: Text(
            "johnsmith@gmail.com"),
        isThreeLine: true,
      ),);
  }
}

