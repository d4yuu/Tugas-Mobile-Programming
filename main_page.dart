import 'package:flutter/material.dart';
import 'package:registrasi/pages/register_page.dart';
import 'package:registrasi/pages/diet_plan.dart';
import 'package:registrasi/pages/exercises.dart';
import 'package:registrasi/pages/medical_tip.dart';
import 'package:registrasi/pages/yoga.dart';

class MainPages extends StatelessWidget {
  final RegistrationData data;

  const MainPages({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.pink[100], // background pink
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting text
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Good Morning\n${data.nama}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Search bar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 8),
                    Text("Search", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Grid menu (2x2)
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: const EdgeInsets.all(16),
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildMenu(Icons.fastfood, "Diet Plan", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => DietPlanPage()),
                      );
                    }),
                    _buildMenu(Icons.fitness_center, "Exercises", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ExercisesPage()),
                      );
                    }),
                    _buildMenu(Icons.local_hospital, "Medical Tips", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => MedicalTipsPage()),
                      );
                    }),
                    _buildMenu(Icons.self_improvement, "Yoga", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => YogaPage()),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Bottom Navigation
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.today),
              label: "Today",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: "Tomorrow",
            ),
          ],
        ),
      ),
    );
  }
}

// Simple menu card widget
Widget _buildMenu(IconData icon, String title, VoidCallback onTap) {
  return InkWell(                      // InkWell untuk efek ripple
    onTap: onTap,                      // aksi ketika di-tap
    borderRadius: BorderRadius.circular(16),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 50, color: Colors.pink),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    ),
    ),
  );
}