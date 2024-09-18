import 'package:school/App/routes/app_routes.dart';
import 'package:school/App/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  _buildQuickActions(),
                  _buildRecentActivity(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() { 
    return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.blue.shade800],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back,',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                       "deidine cheigeur",
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "physique",
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
                  ),
                ],
              ),
            ],
          ),
        );
       
  }

  Widget _buildQuickActions() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Actions',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              _buildActionButton(Icons.calendar_today, 'Calendar', () {
                Navigator.pushNamed(context, Routes.clander);
                // Navigate to Calendar page
              }), 
              _buildActionButton(Icons.grade, 'Grades', () {
                Navigator.pushNamed(context, Routes.grade);
                // Navigate to Grades page
              }), 
              _buildActionButton(Icons.event, 'Events', () {
                Navigator.pushNamed(context, Routes.grade);
                // Navigate to Events page
              }), 
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, VoidCallback onPressed) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onPressed,
          child: Icon(icon, size: 30),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20), 
          ),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildRecentActivity() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Activity',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          _buildActivityCard(
            icon: Icons.assignment_turned_in,
            title: 'Math Assignment Submitted',
            subtitle: 'You submitted your Math assignment.',
            time: '2 hours ago',
          ),
          _buildActivityCard(
            icon: Icons.grade,
            title: 'New Grade Posted',
            subtitle: 'Your Science test grade has been posted.',
            time: '1 day ago',
          ),
          _buildActivityCard(
            icon: Icons.event_available,
            title: 'Upcoming Event Reminder',
            subtitle: 'School Sports Day is in 3 days.',
            time: '2 days ago',
          ),
        ],
      ),
    );
  }

  Widget _buildActivityCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade50,
          child: Icon(icon, color: Colors.blue),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(time, style: TextStyle(color: Colors.grey)),
      ),
    );
  }
}
