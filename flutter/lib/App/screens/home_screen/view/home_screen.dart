import 'package:school/App/routes/app_routes.dart';
import 'package:school/App/screens/base_screen/view/base_screen.dart';
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
    return BaseScreen(
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        builder: (context, state) {
          return   Center(
            child:  ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.grade);
          },
          
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: Colors.blue,
            padding: EdgeInsets.all(20),      // Background color
          ), 
          child: Icon(Icons.check, size: 30, color: Colors.white),
        ),
          );
        },
      ),
    );
  }
}