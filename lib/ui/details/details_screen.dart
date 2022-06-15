import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_test/app/app_theme.dart';
import 'package:flutter_api_test/services/user_list/reponse/data.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.userData}) : super(key: key);

  final Data userData;
  static const String route = "details";

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detailed Info"),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: size.width * 0.3,
                width: size.width * 0.3,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(90),
                ),
                child: CachedNetworkImage(
                  imageUrl: userData.avatar.toString(),
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                  errorWidget: (_, __, ___) => Container(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppTheme.secondaryColor,
                      foregroundColor: AppTheme.white,
                      radius: 14,
                      child: const Icon(
                        Icons.person_outline,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      "Full Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  "${userData.firstName} ${userData.lastName}",
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppTheme.secondaryColor,
                      foregroundColor: AppTheme.white,
                      radius: 14,
                      child: const Icon(
                        Icons.email_outlined,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      "Email Address",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  userData.email.toString(),
                  style: TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
