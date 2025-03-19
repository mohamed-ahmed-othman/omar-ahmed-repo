import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oop/core/di/dependency_injections.dart';
import 'package:oop/core/routing/routes.dart';
import 'package:oop/features/login/logic/cubit/login_cubit.dart';
import 'package:oop/features/login/ui/screens/login_screen.dart';
import 'package:oop/features/onBoarding/ui/onboarding_screen.dart';
import 'package:oop/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:oop/features/signup/ui/screens/sign_up_screen.dart';

import '../../features/home/ui/screens/home_screen.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<SignUpCubit>(),
                  child: const SignUpScreen(),
                ));
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${settings.name}"),
            ),
          ),
        );
    }
  }
}
