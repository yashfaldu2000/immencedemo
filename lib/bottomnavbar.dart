import 'package:flutter/material.dart';
import 'package:immencedemo/profile.dart';
import 'package:immencedemo/users.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List pages=[
    Users(),
    Profile()
  ];

  int currentindex=0;
  void onTap(int index){
    setState(() {
      currentindex=index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[currentindex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: currentindex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(label: "Users",icon: Icon(Icons.people),)
            ,BottomNavigationBarItem(label: "Profile",icon: Icon(Icons.people)),


          ],),
      ),
    );
  }
}
