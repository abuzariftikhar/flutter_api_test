import 'package:flutter/material.dart';
import 'package:flutter_api_test/app/app_theme.dart';
import 'package:flutter_api_test/app/routes.dart';
import 'package:flutter_api_test/services/dio_client_provider.dart';
import 'package:flutter_api_test/services/user_list/user_service.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) {
            final dioProvider = DioClientProvider(
              baseUrl: "https://reqres.in/api",
            );
            return dioProvider.dio;
          },
        ),
        Provider(
          create: (context) => UserListService(
            Provider.of(context, listen: false),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        theme: ThemeData(
          primarySwatch: AppTheme.primaryColor,
          splashFactory: InkRipple.splashFactory,
          splashColor: AppTheme.secondaryColor.withOpacity(0.2),
          highlightColor: Colors.transparent,
        ),
      ),
    );
  }
}
