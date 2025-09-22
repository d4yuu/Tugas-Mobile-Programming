import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MedicalTipsPage(),
  ));
}

class MedicalTipsPage extends StatelessWidget {
  const MedicalTipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: const Text("Medical Tips"),
        backgroundColor: Colors.pink[200],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ListTile(
            leading: Icon(Icons.local_hospital, color: Colors.red),
            title: Text("Stay Hydrated"),
            subtitle: Text("Minum minimal 8 gelas air setiap hari."),
          ),
          ListTile(
            leading: Icon(Icons.favorite, color: Colors.pink),
            title: Text("Exercise Regularly"),
            subtitle: Text("Lakukan olahraga minimal 30 menit sehari."),
          ),
          ListTile(
            leading: Icon(Icons.bedtime, color: Colors.blue),
            title: Text("Get Enough Sleep"),
            subtitle: Text("Tidur 7-8 jam tiap malam."),
          ),
          ListTile(
            leading: Icon(Icons.no_food, color: Colors.orange),
            title: Text("Avoid Junk Food"),
            subtitle: Text("Kurangi makanan cepat saji & gorengan."),
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
