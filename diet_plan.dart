import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DietPlanPage(),
  ));
}

class DietPlanPage extends StatelessWidget {
  const DietPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        title: const Text("Diet Plan"),
        backgroundColor: Colors.pink[200],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildDay("Monday", "Breakfast: Oatmeal\nLunch: Salad\nSnacks: Fruit\nDinner: Grilled Chicken"),
          _buildDay("Tuesday", "Breakfast: Smoothie\nLunch: Sandwich\nSnacks: Yogurt\nDinner: Fish & Veggies"),
          _buildDay("Wednesday", "Breakfast: Boiled Eggs\nLunch: Rice + Veggies\nSnacks: Nuts\nDinner: Soup"),
          _buildDay("Thursday", "Breakfast: Toast\nLunch: Pasta\nSnacks: Banana\nDinner: Stir Fry"),
          _buildDay("Friday", "Breakfast: Pancakes\nLunch: Sushi\nSnacks: Apple\nDinner: Beef Steak"),
          _buildDay("Saturday", "Breakfast: Waffles\nLunch: Burger\nSnacks: Chips\nDinner: Pizza"),
          _buildDay("Sunday", "Breakfast: Nasi Uduk\nLunch: Ayam Bakar\nSnacks: Es Buah\nDinner: Soto Ayam"),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.today), label: "Today"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Tomorrow"),
        ],
      ),
    );
  }

  static Widget _buildDay(String day, String menu) {
    return Card(
      child: ListTile(
        title: Text(day, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(menu),
      ),
    );
  }
}
