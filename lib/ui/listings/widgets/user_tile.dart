import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_test/app/app_theme.dart';
import 'package:flutter_api_test/services/user_list/reponse/data.dart';
import 'package:flutter_api_test/ui/details/details_screen.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    Key? key,
    required this.userData,
  }) : super(key: key);
  final Data userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Material(
        color: AppTheme.white,
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              DetailsScreen.route,
              arguments: userData,
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: userData.avatar.toString(),
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                    errorWidget: (_, __, ___) => Container(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${userData.firstName} ${userData.lastName}",
                        style: TextStyle(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        userData.email.toString(),
                        style: const TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppTheme.primaryColor,
                  size: 18,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
