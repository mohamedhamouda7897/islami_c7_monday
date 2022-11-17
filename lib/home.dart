import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('islamiiii')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.amber,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,

            ),
            label: '',
              backgroundColor: Colors.blue
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,

              ),
              label: '',
          backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,

              ),
              label: '',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,

              ),
              label: '',
              backgroundColor: Colors.blue)
        ],
      ),
    );
  }
}
