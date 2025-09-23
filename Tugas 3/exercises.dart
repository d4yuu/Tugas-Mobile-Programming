import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ExercisesPage(),
  ));
}

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: const Text("Exercises"),
        backgroundColor: Colors.pink[200],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildDay("Monday", "Push-ups, Squats, Plank"),
          _buildDay("Tuesday", "Jogging, Lunges, Sit-ups"),
          _buildDay("Wednesday", "Cycling, Burpees, Stretching"),
          _buildDay("Thursday", "Yoga, Jump Rope, Crunches"),
          _buildDay("Friday", "Swimming, Pull-ups, Side Plank"),
          _buildDay("Saturday", "Hiking, Deadlifts, Jumping Jacks"),
          _buildDay("Sunday", "Rest Day or Light Stretching"),
        ],
      ),
      bottomNavigationBar: _bottomNav(),
    );
  }

  Widget _buildDay(String day, String workout) {
    return Card(
      child: ListTile(
        title: Text(day, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(workout),
      ),
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
