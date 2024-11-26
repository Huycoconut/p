import 'package:clean_architector_with_mvvm_getx/presentation/forgot_password/forgot_password.dart';
import 'package:clean_architector_with_mvvm_getx/presentation/login/login.dart';
import 'package:clean_architector_with_mvvm_getx/presentation/main/main_view.dart';
import 'package:clean_architector_with_mvvm_getx/presentation/onboarding/onboarding.dart';
import 'package:clean_architector_with_mvvm_getx/presentation/register/register.dart';
import 'package:clean_architector_with_mvvm_getx/presentation/resources/strings_manager.dart';
import 'package:clean_architector_with_mvvm_getx/presentation/splash/splash.dart';
import 'package:clean_architector_with_mvvm_getx/presentation/store_detail/store_detail.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onborading";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(child: Text(AppStrings.noRouteFound)),
      ),
    );
  }
}
