import 'package:flutter/material.dart';


class BottomNavAdmin extends StatefulWidget {
  BottomNavAdmin({key}) : super(key: key);
  

  @override
  State<BottomNavAdmin> createState() => _BottomNavAdminState();
}

class _BottomNavAdminState extends State<BottomNavAdmin> {
   int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        items :[
          BottomNavigationBarItem(icon: Icon(Icons.home),
           label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_add),
            label: "Register voters",
          ), 
           BottomNavigationBarItem(
            icon:Icon(Icons.how_to_vote), 
            label: 'Create Elections ',
            ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo[900],
        onTap: _onItemTapped,
      ),
    );
  }
}