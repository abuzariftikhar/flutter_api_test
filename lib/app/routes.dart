import 'package:flutter/material.dart';
import 'package:flutter_api_test/services/user_list/reponse/data.dart';
import 'package:flutter_api_test/ui/details/details_screen.dart';
import 'package:flutter_api_test/ui/home/home_screen.dart';
import 'package:flutter_api_test/ui/home/store/home_store.dart';
import 'package:provider/provider.dart';

class AppRoutes {
  const AppRoutes._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.route:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(
            store: HomeStore(
              userListService: Provider.of(context, listen: false),
            ),
          ),
        );
      case DetailsScreen.route:
        return MaterialPageRoute(
          builder: (context) => DetailsScreen(
            userData: settings.arguments as Data,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Material(
            child: Center(
              child: Text(
                "You Are Lost!\nCouldn't find the page you're looking for...",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        );
    }
  }
}
