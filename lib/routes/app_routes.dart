import 'package:flutter/material.dart';
import 'package:girimote/features/auth/presentation/pages/login_screen.dart';
import 'package:girimote/features/auth/presentation/pages/signup_screen.dart';
import 'package:girimote/features/dashboard/presentation/pages/dashboard_screen.dart';
import 'package:girimote/features/welcome/presentation/pages/welcome_screen.dart';

class AppRoutes {
  static const String welcomeRoute = '/';
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String dashboardRoute = '/dashboard';

  static Map<String, WidgetBuilder> routes = {
    welcomeRoute: (context) => const WelcomeScreen(),
    loginRoute: (context) => const LoginScreen(),
    signupRoute: (context) => const SignUpScreen(),
    dashboardRoute: (context) => const DashboardScreen(),
  };
}
