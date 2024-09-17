import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view/onboarding.dart';

// Events
abstract class OnboardingEvent {}

class PageChangedEvent extends OnboardingEvent {
  final int pageIndex;
  PageChangedEvent(this.pageIndex);
}

class NextPageEvent extends OnboardingEvent {}

// States
class OnboardingState {
  final int currentPage;
  final List<OnboardingPage> pages;

  OnboardingState(this.currentPage, this.pages);
}

// Bloc
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final PageController pageController;

  OnboardingBloc(this.pageController) : super(OnboardingState(0, [
    OnboardingPage(
      title: 'Welcome to Stellar',
      description: 'Your personal education assistant',
      color: Colors.deepPurple,
      imageUrl: 'assets/graduation_cap.png',
    ),
    OnboardingPage(
      title: 'Mark Homework as completed',
      description: 'Keep track of your assignments easily',
      color: Colors.orange[50]!,
      imageUrl: 'assets/student_studying.png',
    ),
    OnboardingPage(
      title: 'Rectify your Attendance',
      description: 'Manage your attendance records',
      color: Colors.lightBlue[100]!,
      imageUrl: 'assets/students_jumping.png',
    ),
    OnboardingPage(
      title: 'Student Exam & Report Cards',
      description: 'Access your academic performance',
      color: Colors.pink[50]!,
      imageUrl: 'assets/report_cards.png',
    ),
  ])) {
    on<PageChangedEvent>((event, emit) {
      emit(OnboardingState(event.pageIndex, state.pages));
    });

    on<NextPageEvent>((event, emit) {
      final nextPage = state.currentPage + 1;
      if (nextPage < state.pages.length) {
        pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }
}