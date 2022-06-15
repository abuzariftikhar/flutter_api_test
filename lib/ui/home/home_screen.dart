import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_test/ui/favourites/favorites_page.dart';
import 'package:flutter_api_test/ui/home/store/home_store.dart';
import 'package:flutter_api_test/ui/home/widgets/custom_bottombar.dart';
import 'package:flutter_api_test/ui/listings/listings_page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.store,
  }) : super(key: key);

  final HomeStore store;

  static const String route = "/";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget getPage(int index) {
    switch (index) {
      case 0:
        return ListingPage(
          store: widget.store,
        );
      case 1:
        return const FavoritesPage();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      bottomNavigationBar: CustomBottomBar(store: widget.store),
      body: Observer(
        builder: (context) {
          return PageTransitionSwitcher(
            reverse: true,
            transitionBuilder: (Widget child1, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return SharedAxisTransition(
                fillColor: Colors.transparent,
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.vertical,
                child: child1,
              );
            },
            child: getPage(
              widget.store.tabIndex,
            ),
          );
        }
      ),
    );
  }
}
