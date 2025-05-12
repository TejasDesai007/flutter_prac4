import 'package:flutter/material.dart';
import 'company_details.dart';
import 'my_details.dart';
import 'registration_form.dart';
import 'navigation_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Training & Placement Office',
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.indigo],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSectionTitle("About Training & Placement Office"),
              _buildAboutTPO(),
              SizedBox(height: 20),
              _buildSectionTitle("Our Achievements"),
              _buildAchievementCard("90% Placement Rate",
                  "Over 500+ students placed in top MNCs."),
              _buildAchievementCard("Internship Opportunities",
                  "100+ internship offers every year."),
              _buildAchievementCard(
                  "Top Recruiters", "Google, Microsoft, Amazon, TCS, Infosys."),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
      ),
    );
  }

  Widget _buildAboutTPO() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "The Training & Placement Office (TPO) plays a crucial role in providing career opportunities for students. "
          "Our mission is to bridge the gap between academics and industry by organizing training sessions, workshops, and placement drives. "
          "We have a strong network with top recruiters, ensuring a high placement rate and numerous internship opportunities for students.",
          style: TextStyle(fontSize: 16, color: Colors.black87),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  Widget _buildAchievementCard(String title, String subtitle) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(Icons.verified, color: Colors.green),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
      ),
    );
  }
}
