import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_test/ui/home/store/home_store.dart';
import 'package:flutter_api_test/ui/listings/widgets/user_tile.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListingPage extends StatelessWidget {
  const ListingPage({Key? key, required this.store}) : super(key: key);

  final HomeStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return store.isBusy && store.users.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return UserTile(
                        userData: store.users[index],
                      );
                    },
                    childCount: store.users.length,
                  ),
                ),
                SliverToBoxAdapter(
                  child: store.totalCount == store.users.length
                      ? const Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Text(
                            "End of List",
                            textAlign: TextAlign.center,
                          ),
                        )
                      : CupertinoButton(
                          child: const Text("Load More"),
                          onPressed: () {
                            store.loadUsers(2);
                          },
                        ),
                )
              ],
            );
    });
  }
}
