
import 'package:flutter/material.dart';
import 'package:flutter_api_test/app/app_theme.dart';
import 'package:flutter_api_test/ui/home/store/home_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomBottomBar extends StatefulWidget {
  final HomeStore store;

  const CustomBottomBar({
    Key? key,
    required this.store,
  }) : super(key: key);
  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return SizedBox(
        height: 72,
        child: Material(
          clipBehavior: Clip.antiAlias,
          color: AppTheme.grey,
          child: Stack(
            children: [
              SizedBox(
                height: 80,
                child: Material(
                  type: MaterialType.transparency,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BottomBarIcon(
                        iconURL: Icons.home,
                        index: 0,
                        store: widget.store,
                      ),
                      BottomBarIcon(
                        iconURL: Icons.favorite,
                        index: 1,
                        store: widget.store,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class BottomBarIcon extends StatefulWidget {
  final int index;
  final IconData iconURL;
  final HomeStore store;

  const BottomBarIcon({
    Key? key,
    required this.index,
    required this.store,
    required this.iconURL,
  }) : super(key: key);
  @override
  State<BottomBarIcon> createState() => _BottomBarIconState();
}

class _BottomBarIconState extends State<BottomBarIcon> {
  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5,
      height: 66,
      child: Observer(
        builder: (context) {
          return InkResponse(
          
            radius: 44,
            onTap: () {
              widget.store.tabIndex = widget.index;
            },
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: widget.index == widget.store.tabIndex
                  ? SizedBox(
                      key: const Key("selected"),
                      height: 24,
                      child: Icon(widget.iconURL, color: AppTheme.primaryColor
                          // size: 22,
                          ),
                    )
                  : SizedBox(
                      key: const Key("unselected"),
                      height: 24,
                      child: Icon(
                        widget.iconURL,
                        color:
                            Theme.of(context).iconTheme.color!.withOpacity(0.2),
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }
}
