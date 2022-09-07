import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_test/app/app_theme.dart';
import 'package:flutter_api_test/providers/home_provider.dart';
import 'package:flutter_api_test/services/user_list/reponse/user_list.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, value, _) {
        return FutureBuilder<UserList?>(
          future: value.getAllUsers(0),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data!.data!.length.toString());
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: snapshot.data!.data!
                    .map((e) => ListTile(
                          title: Text(
                            e.email.toString(),
                          ),
                        ))
                    .toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}
