import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: YogaPage(),
  ));
}
class YogaPage extends StatelessWidget {
  const YogaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: const Text("Yoga"),
        backgroundColor: Colors.pink[200],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.self_improvement, color: Colors.purple),
            title: Text("Mountain Pose"),
            subtitle: Text("Postur dasar berdiri dengan tegak."),
          ),
          ListTile(
            leading: Icon(Icons.self_improvement, color: Colors.green),
            title: Text("Downward Dog"),
            subtitle: Text("Posisi segitiga dengan tangan & kaki."),
          ),
          ListTile(
            leading: Icon(Icons.self_improvement, color: Colors.blue),
            title: Text("Child's Pose"),
            subtitle: Text("Duduk dengan lutut dan tangan rileks."),
          ),
          ListTile(
            leading: Icon(Icons.self_improvement, color: Colors.orange),
            title: Text("Warrior Pose"),
            subtitle: Text("Posisi berdiri dengan kaki terbuka & tangan ke samping."),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNav(),
    );
  }

  Widget _bottomNav() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.today), label: "Today"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Tomorrow"),
      ],
    );
  }
}
