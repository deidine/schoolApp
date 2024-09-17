import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/App/routes/app_routes.dart';
import '../bloc/onboarding_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(_pageController),
      child: Scaffold(
        body: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            return Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: state.pages.length,
                  onPageChanged: (int page) {
                    context.read<OnboardingBloc>().add(PageChangedEvent(page));
                  },
                  itemBuilder: (context, index) {
                    return state.pages[index];
                  },
                ),
                Positioned(
                  bottom: 50.0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(state),
                  ),
                ),
           Positioned(
  bottom: 60.0,
  right: 0,
  left: 0,
  child: state.currentPage == state.pages.length - 1
      ? ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, Routes.homeScreen);
          },
          
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: Colors.blue,
            padding: EdgeInsets.all(20),      // Background color
          ),
          child: Icon(Icons.check, size: 30, color: Colors.white),
        )
      :  ElevatedButton(
          onPressed: () {
       
              context.read<OnboardingBloc>().add(NextPageEvent());   },
          
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: Colors.blue,
            padding: EdgeInsets.all(20),      // Background color
          ),
          child: Icon(Icons.arrow_back_ios, size: 30,textDirection: TextDirection.rtl,
              color: Colors.white,),
        )

),
  ],
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator(OnboardingState state) {
    return List<Widget>.generate(
      state.pages.length,
      (index) => _indicator(index == state.currentPage),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.deepPurple : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final String imageUrl;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.color,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          Image.asset(
            imageUrl,
            height: 300,
          ),
          SizedBox(height: 50),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
         Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
         
        ],
      ),
    );
  }
}