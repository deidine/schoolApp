import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school/App/routes/app_routes.dart';
import 'package:school/App/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:school/App/screens/home_screen/bloc/onboarding_bloc.dart';
import 'package:school/App/screens/home_screen/view/home_screen.dart';
import 'package:school/App/screens/home_screen/view/onboarding.dart';
import 'package:school/App/screens/splash_screen/view/splash_screen.dart';
import 'package:school/App/screens/clander/view/clander.dart';
import 'package:school/App/screens/clander/bloc/clander_bloc.dart';

abstract class RouteNavigator {
  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.splash: (BuildContext context) => const SplashScreen(),
    Routes.onboarding: (BuildContext context) => BlocProvider(
          create: (context) => OnboardingBloc(PageController()),
          child: OnboardingScreen(),
        ),
    Routes.homeScreen: (BuildContext context) => BlocProvider(
          create: (context) => HomeScreenBloc(),
          child: const HomeScreen(),
        ),
    Routes.clander: (BuildContext context) => BlocProvider(
          create: (context) => ClanderBloc(),
          child: const Clander(),
        )
  };
}
