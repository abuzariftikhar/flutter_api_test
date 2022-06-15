import 'package:flutter/cupertino.dart';
import 'package:flutter_api_test/app/app_theme.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.heart_fill,
            size: 90,
            color: AppTheme.lightBlue,
          ),
          const SizedBox(height: 20),
          Text(
            "NO FAVORITES ADDED YET!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppTheme.lightBlue,
            ),
          )
        ],
      ),
    );
  }
}
