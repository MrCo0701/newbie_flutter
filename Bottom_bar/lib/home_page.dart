import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int Text_index = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOption = <Widget>[
    Text('index 0: Home', style: optionStyle),
    Text('index 1: Business', style: optionStyle),
    Text('index 3: School', style: optionStyle),
  ];

  void onItemTap(int index) {
    setState(() {
      Text_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bottom navigation bar'),
      ),
      body: Center(child: _widgetOption.elementAt(Text_index)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: Text_index, /// focus vao lua chon nao trong nhung lua chon o duoi
        selectedItemColor: Colors.amber[800],
        onTap: onItemTap,
      ),
    );
  }
}
